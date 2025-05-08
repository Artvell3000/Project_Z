import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/core/domain/entity/tokens/tokens.dart';
import 'package:project_z/core/domain/repositories/basket_repository.dart';
import 'package:project_z/core/domain/repositories/repositories.dart';
import 'package:project_z/core/error/entity/domain_exception.dart';
import 'package:project_z/features/basket/domain/entity/basket.dart';

part 'basket_screen_bloc.freezed.dart';

part 'basket_screen_event.dart';

part 'basket_screen_state.dart';

@injectable
class BasketScreenBloc extends Bloc<BasketScreenEvent, BasketScreenState> {
  BasketScreenBloc(this._iBasketRepository, this._iTokenRepository) : super(const BasketScreenState.loading()) {
    on<BasketScreenEvent>((event, emit) async {
      await event.map(
          init: (d) async => await _onInit(d, emit),
          updateQuantity: (d) async => await _onUpdateQuantity(d, emit),
          removeItem: (d) async => await _onRemove(d, emit),
          refresh: (d) async => await _onRefresh(d, emit));
    });
    add(const BasketScreenEvent.init());
  }

  final IBasketRepository _iBasketRepository;
  final ITokenRepository _iTokenRepository;
  AuthTokens? _tokens;
  late Basket _basket;

  /// on event
  Future<void> _onInit(_BasketScreenInitEvent d, Emitter<BasketScreenState> emit) async {
    await _updateBasket(emit);
  }

  Future<void> _onRefresh(_BasketScreenRefreshEvent d, Emitter<BasketScreenState> emit) async {
    await _updateBasket(emit);
  }

  Future<void> _onRemove(_BasketScreenRemoveItemEvent d, Emitter<BasketScreenState> emit) async {
    if (_tokens == null) {
      emit(const BasketScreenState.needAuth());
      return;
    }
    _basket.removeItemById(d.itemId);
    _loadBasket(_basket, emit);

    final response = await _iBasketRepository.remove(_tokens!.accessToken, d.itemId);
    response.getLeft().map((e){
      _loadError(e, emit);
    });
  }

  Future<void> _onUpdateQuantity(_BasketScreenUpdateQuantityEvent d, Emitter<BasketScreenState> emit) async {
    Logger().i('[ _onUpdateQuantity]');
    if (_tokens == null) {
      emit(const BasketScreenState.needAuth());
      return;
    }

    final item = _basket.updateItemById(d.itemId, d.amount);
    _loadBasket(_basket, emit);

    final response = await _iBasketRepository.updateAmount(
        _tokens!.accessToken,
        id: item.id,
        productId: item.product.id,
        amount: item.amount
    );
    response.getLeft().map((e){
      _loadError(e, emit);
    });
  }

  /// private methods
  void _loadError(DomainError e, Emitter<BasketScreenState> emit) async {
    e.maybeMap(
      orElse: () => emit(BasketScreenState.error(e)),
      unauthorized: (d) => emit(const BasketScreenState.needAuth()),
    );
  }

  void _loadBasket(Basket basket, Emitter<BasketScreenState> emit) {
    if (basket.isEmpty) {
      emit(const BasketScreenState.loadedEmpty());
    } else {
      emit(BasketScreenState.loaded(basket, basket.fullAmount));
    }
  }

  Future<void> _updateBasket(Emitter<BasketScreenState> emit) async {
    final tokens = (await _iTokenRepository.find()).getOrElse((e) => null);
    if (tokens == null) {
      emit(const BasketScreenState.needAuth());
      return;
    }

    final basketResponse = await _iBasketRepository.getMyBasket(tokens.accessToken);
    basketResponse.fold((e) {
      _loadError(e, emit);
    }, (items) {
      _tokens = tokens;
      _basket = Basket(items);
      _loadBasket(_basket, emit);
    });
  }
}
