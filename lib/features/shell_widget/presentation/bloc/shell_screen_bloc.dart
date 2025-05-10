import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:project_z/core/domain/entity/basket/basket.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/core/domain/entity/tokens/tokens.dart';
import 'package:project_z/core/domain/repositories/repositories.dart';
import 'package:project_z/core/error/entity/domain_exception.dart';

part 'shell_screen_event.dart';

part 'shell_screen_state.dart';

part 'shell_screen_bloc.freezed.dart';

@injectable
class ShellScreenBloc extends Bloc<ShellScreenEvent, ShellScreenState> {
  final IBasketRepository _iBasketRepository;
  final IUserRepository _iUserRepository;
  final IOrderRepository _iOrderRepository;
  final ITokenRepository _iTokenRepository;
  AuthTokens? _tokens;

  List<BasketItem> _basketItems  = [];
  String _geo = '';

  int get countItems => _basketItems.countProducts();
  List<BasketItem> get basketItems => List<BasketItem>.from(_basketItems);

  ShellScreenBloc(this._iTokenRepository, this._iBasketRepository, this._iUserRepository, this._iOrderRepository) : super(const ShellScreenState.loading()) {
    on<ShellScreenEvent>((event, emit) async {
      //Logger().i('shell event : $event');
      await event.map(
          init: (d) async => await _onInit(d, emit),
          addToBasket: (d) async => await _onAddToBasket(d, emit),
          createOrder: (d) async => await _onCreateOrder(d, emit),
          error: (d) async => await _onError(d, emit),
          updateBasket: (d) async => await _onUpdateBasket(d, emit),
          tryCreateOrder: (d) async => await _onTryingCreateOrder(emit)
      );
    });
    add(const ShellScreenEvent.init());
  }

  // on event
  Future<void> _onInit(_InitAuthEvent d, Emitter<ShellScreenState> emit) async {
    final response = await _iTokenRepository.find();
    if(response.isRight()){
      _tokens = response.getOrElse((e) => throw(e));
      if(_tokens!=null){
        await _update(_tokens!.accessToken, emit);
      }
    }
  }

  Future<void> _onUpdateBasket(_UpdateBasketEvent d, Emitter<ShellScreenState> emit) async {
    _basketItems.clear();
    _basketItems.addAll(d.items);
    emit(ShellScreenState.loaded(_geo, _basketItems.countProducts()));
  }

  Future<void> _onAddToBasket(_AddToBasketEvent d, Emitter<ShellScreenState> emit) async {
    if(_tokens == null){
      emit(const ShellScreenState.needAuth());
    } else {
      emit(ShellScreenState.addingToBasket(d.productId));
      final response = await _iBasketRepository.addToBasket(_tokens!.accessToken, d.productId);
      await response.fold((e) async {
        _handleError(e,emit);
        }, (result) async {
        await _updateBasket(_tokens!.accessToken, emit);
        Logger().i(
          _basketItems.map((el) => el.product.name).toList().toString()
        );
        emit(ShellScreenState.updated(
            geo: _geo,
            amountItems:  _basketItems.countProducts(),
            isUpdatedBasket: true,
            addedProduct: d.productId,
            isTryingCreateOrder: d.withCreateOrder
        ));
      });
    }
  }

  Future<void> _onTryingCreateOrder(Emitter<ShellScreenState> emit) async {
    emit(ShellScreenState.updated(
        geo: _geo,
        amountItems:  _basketItems.countProducts(),
        isTryingCreateOrder: true
    ));
  }

  Future<void> _onCreateOrder(_CreateOrderEvent d, Emitter<ShellScreenState> emit) async {
    //Logger().i('ShellScreenEvent.createOrder');
    if(_tokens == null){
      emit(const ShellScreenState.needAuth());
    } else {
      emit(const ShellScreenState.creatingOrder());
      final response = await _iOrderRepository.create(_tokens!.accessToken);
      //Logger().i('answer order $response');
      response.fold((e){
        _handleError(e,emit);
      }, (order){
        _basketItems.clear();
        emit(ShellScreenState.updated(
            geo: _geo,
            amountItems:  _basketItems.countProducts(),
            isUpdatedBasket: true,
            isUpdatedOrders: true,
        ));
      });
    }
  }

  Future<void> _onError(_ErrorAuthEvent d, Emitter<ShellScreenState> emit) async {

  }


  // private methods

  void _handleError(DomainError e, Emitter<ShellScreenState> emit){
    e.maybeMap(
        orElse: () => emit(ShellScreenState.error(e)),
        unauthorized: (d) => emit(const ShellScreenState.needAuth())
    );
  }
  
  Future<void> _updateBasket(String token, Emitter<ShellScreenState> emit) async {
    final basketResponse = await _iBasketRepository.getMyBasket(token);
    if(basketResponse.isRight()){
      _basketItems = basketResponse.getOrElse((e) => throw(Exception()));
    }
  }
  
  Future<void> _update(String token,Emitter<ShellScreenState> emit) async {
    final basketResponse = await _iBasketRepository.getMyBasket(token);
    final userResponse = await _iUserRepository.getUser(token);

    if(basketResponse.isRight() && userResponse.isRight()){
      _basketItems = basketResponse.getOrElse((e) => throw(Exception()));
      final user  = userResponse.getOrElse((e) => throw(Exception()));
      _geo = user.town ?? user.district ?? '';
      emit(
        ShellScreenState.loaded(_geo, _basketItems.countProducts())
      );
    }
  }

}
