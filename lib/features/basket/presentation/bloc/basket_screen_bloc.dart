import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/core/bloc/buy_flow_facade/buy_flow_facade_bloc.dart';
import 'package:project_z/core/domain/entity/basket/basket.dart';
import 'package:project_z/core/domain/entity/category/category.dart';

part 'basket_screen_bloc.freezed.dart';

part 'basket_screen_event.dart';
part 'basket_screen_state.dart';

@injectable
class BasketScreenBloc extends Bloc<BasketScreenEvent, BasketScreenState> {

  late final StreamSubscription<BuyFlowFacadeState> subscription;
  final BuyFlowFacadeBloc bloc;
  late Map<Category,List<BasketItem>> _basket;


  BasketScreenBloc(this.bloc) : super(const BasketScreenState.loading()) {
    on<BasketScreenEvent>((event, emit) async {
      await event.mapOrNull(
        loaded: (d) => _onLoaded(d, emit),
        loadedEmpty: (d) => _onLoadedEmpty(d, emit),
        init: (d) => _onInit(d, emit),
        error: (d) => _onError(d, emit),
        incrementQuantity: (d) => _increment(d, emit),
        decrementQuantity: (d) => _decrement(d, emit),
        removeItem: (d) => _remove(d, emit)
      );
    });
    add(const BasketScreenEvent.init());
  }

  Future<void> _remove(_BasketScreenRemoveItemEvent d, Emitter<BasketScreenState> emit) async {
    _basket = _removeBasketItemById( _basket, d.itemId);
    emit(BasketScreenState.loaded(
      items: _basket,
      amount: _getFullAmount(_basket),
      fullPrice: _getFullPrice(_basket),
      categoryPrice: _getMapCategoryPrice(_basket),
      fullPriceWithDiscount: _getFullPriceWithDiscount(_basket),
    ));
  }

  Future<void> _decrement(_BasketScreenDecrementQuantityEvent d, Emitter<BasketScreenState> emit) async {
    _basket = _decrementBasketItemAmount(basket: _basket, itemId: d.itemId);
    emit(BasketScreenState.loaded(
      items: _basket,
      amount: _getFullAmount(_basket),
      fullPrice: _getFullPrice(_basket),
      categoryPrice: _getMapCategoryPrice(_basket),
      fullPriceWithDiscount: _getFullPriceWithDiscount(_basket),
    ));
  }

  Future<void> _increment(_BasketScreenIncrementQuantityEvent d, Emitter<BasketScreenState> emit) async {
    _basket = _incrementBasketItemAmount(basket: _basket, itemId: d.itemId);
    emit(BasketScreenState.loaded(
      items: _basket,
      amount: _getFullAmount(_basket),
      fullPrice: _getFullPrice(_basket),
      categoryPrice: _getMapCategoryPrice(_basket),
      fullPriceWithDiscount: _getFullPriceWithDiscount(_basket),
    ));
  }

  Future<void> _onError(_BasketScreenErrorEvent d, Emitter<BasketScreenState> emit) async{
    emit(BasketScreenState.error(d.message));
  }
  
  Future<void> _onLoadedEmpty(_BasketScreenLoadedEmptyEvent d, Emitter<BasketScreenState> emit) async {
    emit(const BasketScreenState.loadedEmpty());
  }
  
  Future<void> _onLoaded(_BasketScreenLoadedEvent d, Emitter<BasketScreenState> emit) async {
    _basket = d.items;
    emit(BasketScreenState.loaded(
      items: _basket,
      amount: _getFullAmount(_basket),
      fullPrice: _getFullPrice(_basket),
      categoryPrice: _getMapCategoryPrice(_basket),
      fullPriceWithDiscount: _getFullPriceWithDiscount(_basket),
    ));
  }

  Future<void> _loadBasketFromFacade() async {
    (await bloc.basket).fold((e){
      add(BasketScreenEvent.error(e.toString()));
    }, (b){
      if(b == null){
        add(const BasketScreenEvent.loadedEmpty());
      }else{
        add(BasketScreenEvent.loaded(b));
      }
    });
  }

  
  Future<void> _onInit(_BasketScreenInitEvent d, Emitter<BasketScreenState> emit) async {

    await bloc.state.mapOrNull(
      notAuth: (d) async  {
        bloc.add(const BuyFlowFacadeEvent.requestAuth());
        add(const BasketScreenEvent.loadedEmpty());
      },
      hasAuth: (d) async {
        if(d.isBasketUpdated) {
          await _loadBasketFromFacade();
        }
      }
    );

    subscription = bloc.stream.listen((state){
      Logger().i(state.toString());
      state.mapOrNull(
          // notAuth: (d){
          //   bloc.add(const BuyFlowFacadeEvent.requestAuth());
          //   add(const BasketScreenEvent.loadedEmpty());
          // },
          hasAuth: (d){
            if(d.isBasketUpdated){
              _loadBasketFromFacade();
            }
          }
      );
    });
  }

  //not for event

  double _getFullPriceWithDiscount(Map<Category, List<BasketItem>> basket){
    double fullPrice = 0;
    basket.forEach((key, value){
      for(final el in value){
        fullPrice += (el.amount * el.product.finalPrice);
      }
    });
    return fullPrice;
  }

  double _getFullPrice(Map<Category, List<BasketItem>> basket){
    double fullPrice = 0;
    basket.forEach((key, value){
      for(final el in value){
        fullPrice += (el.amount * (double.tryParse(el.product.price) ?? 0));
      }
    });
    return fullPrice;
  }

  Map<String, String> _getMapCategoryPrice(Map<Category, List<BasketItem>> basket){
    Map<String, String> map = {};
    basket.forEach((key, value){
      double price = 0;
      for(final el in value){
        price += (el.amount * el.product.finalPrice);
      }
      map[key.name] = price.toString();
    });
    return map;
  }

  int _getFullAmount(Map<Category, List<BasketItem>> basket){
    int q = 0;
    for(final el in basket.values){
      for(final item in el){
        q+=item.amount;
      }
    }
    return q;
  }

  Map<Category, List<BasketItem>> _decrementBasketItemAmount({
    required Map<Category, List<BasketItem>> basket,
    required int itemId,
  }) {
    return Map.fromEntries(
      basket.entries.map((categoryEntry) {
        final category = categoryEntry.key;
        final items = categoryEntry.value;

        final itemIndex = items.indexWhere((item) => item.id == itemId);

        if (itemIndex != -1 && items[itemIndex].amount > 1) {
          final updatedItem = items[itemIndex].copyWith(
            amount: items[itemIndex].amount - 1,
            updatedAt: DateTime.now().toIso8601String(),
          );

          final updatedItems = List<BasketItem>.from(items)
            ..[itemIndex] = updatedItem;

          return MapEntry(category, updatedItems);
        }

        return categoryEntry;
      }),
    );
  }

  Map<Category, List<BasketItem>> _incrementBasketItemAmount({
    required Map<Category, List<BasketItem>> basket,
    required int itemId,
  }) {
    return Map.fromEntries(
      basket.entries.map((categoryEntry) {
        final category = categoryEntry.key;
        final items = categoryEntry.value;

        final itemIndex = items.indexWhere((item) => item.id == itemId);

        if (itemIndex != -1) {
          final updatedItem = items[itemIndex].copyWith(
            amount: items[itemIndex].amount + 1,
            updatedAt: DateTime.now().toIso8601String(),
          );

          final updatedItems = List<BasketItem>.from(items)
            ..[itemIndex] = updatedItem;

          return MapEntry(category, updatedItems);
        }

        return categoryEntry;
      }),
    );
  }

  Map<Category, List<BasketItem>> _removeBasketItemById(
    Map<Category, List<BasketItem>> basket,
    int itemId,
  ) {
    final newBasket = <Category, List<BasketItem>>{};

    basket.forEach((category, items) {
      // Фильтруем элементы, оставляя только те, у которых id не совпадает
      final filteredItems = items.where((item) => item.id != itemId).toList();

      // Добавляем в результат только непустые категории
      if (filteredItems.isNotEmpty) {
        newBasket[category] = filteredItems;
      }
    });

    return newBasket;
  }
}
