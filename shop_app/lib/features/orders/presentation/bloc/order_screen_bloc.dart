import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart' as di;
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_domain/domain/entity/order/order.dart';
import 'package:shop_domain/domain/entity/tokens/tokens.dart';
import 'package:shop_domain/domain/repositories/order_repository.dart';
import 'package:shop_domain/domain/repositories/token_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';

part 'order_screen_bloc.freezed.dart';
part 'order_screen_event.dart';
part 'order_screen_state.dart';

@di.injectable
class OrderScreenBloc extends Bloc<OrderScreenEvent, OrderScreenState> {
  OrderScreenBloc(this._iOrderRepository, this._iTokenRepository) : super(const OrderScreenState.loading()) {
    on<OrderScreenEvent>((event, emit) async {
      await event.map(
          init: (d) => _onInit(d, emit),
          refresh:(d) => _onRefresh(d, emit),
          loadMore: (d) => _onLoadMore(d, emit)
      );
    });

    add(const OrderScreenEvent.init());
  }

  final IOrderRepository _iOrderRepository;
  final ITokenRepository _iTokenRepository;
  AuthTokens? _tokens;
  int? _nextPage = 1;
  final List<Order> _orders = [];

  // on event
  Future<void> _onInit(_OrderScreenInitEvent d, Emitter<OrderScreenState> emit) async {
    await _update(emit);
  }

  Future<void> _onRefresh(_OrderScreenRefreshEvent d, Emitter<OrderScreenState> emit) async {
    emit(const OrderScreenState.loading());
    _orders.clear();
    _nextPage = 1;
    await _update(emit);
  }

  Future<void> _onLoadMore(_OrderScreenLoadMoreEvent d, Emitter<OrderScreenState> emit) async {
    if(_tokens == null){
      emit(const OrderScreenState.needAuth());
      return;
    }
    await _loadMore(_tokens!.accessToken,emit);
  }
  
  // private methods
  Future<void> _loadMore( String token,Emitter<OrderScreenState> emit) async {
    if(_nextPage == null){
      emit(OrderScreenState.loaded(items: _orders, page: -1, isAllItems: true));
      return;
    }
    
    final response = await _iOrderRepository.getByPage(token);
    response.fold((e){
      _loadError(e, emit);
    }, (orders){
      Logger().i('orders length ${orders.results.first.items.length}');
      _orders.addAll(orders.results.toList());
      emit(OrderScreenState.loaded(items: _orders, page: _nextPage!, isAllItems: orders.next == null));
      _nextPage = orders.next;
    });
  }

  Future<void> _update(Emitter<OrderScreenState> emit) async {

    final response = await _iTokenRepository.find();
    await response.fold((e) async {
      
    }, (tokens) async {
      if(tokens == null){
        emit(const OrderScreenState.needAuth());
      } else {
        _tokens = tokens;
        _nextPage = 1;
        await _loadMore(tokens.accessToken, emit);
      }
    });
  }

  void _loadError(DomainError e, Emitter<OrderScreenState> emit) async {
    e.maybeMap(
        orElse: () => emit(OrderScreenState.error(e)),
        unauthorized: (d) => emit(const OrderScreenState.needAuth())
    );
  }
}


