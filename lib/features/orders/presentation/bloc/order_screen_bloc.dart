import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/core/bloc/buy_flow_facade/buy_flow_facade_bloc.dart';
import 'package:project_z/core/domain/entity/order/order.dart';

part 'order_screen_bloc.freezed.dart';
part 'order_screen_event.dart';
part 'order_screen_state.dart';

@injectable
class OrderScreenBloc extends Bloc<OrderScreenEvent, OrderScreenState> {
  final BuyFlowFacadeBloc _bloc;
  late StreamSubscription<BuyFlowFacadeState> _subscription;

  OrderScreenBloc(this._bloc) : super(const OrderScreenState.loading()) {
    on<OrderScreenEvent>((event, emit) async {
      await event.map(
          init: (d) => _onInit(d, emit),
          error: (d) => _onError(d, emit),
          load: (d) => _onLoaded(d, emit),
          loadEmpty: (d) => _onLoadedEmpty(d, emit)
      );
    });

    add(const OrderScreenEvent.init());
  }

  Future<void> _loadOrderFromFacade() async {
    (await _bloc.order).fold((e){
      add(OrderScreenEvent.error(e.toString()));
    }, (items){
      if(items == null){
        add(const OrderScreenEvent.loadEmpty());
      }else{
        add(OrderScreenEvent.load(items));
      }
    });
  }

  Future<void> _onInit(_OrderScreenInitEvent d, Emitter<OrderScreenState> emit) async {
    Logger().i(_bloc.state);
    await _bloc.state.mapOrNull(
        notAuth: (d) async  {
          _bloc.add(const BuyFlowFacadeEvent.requestAuth());
          add(const OrderScreenEvent.loadEmpty());
        },
        hasAuth: (d) async {
          if(d.isOrderUpdated) {
            await _loadOrderFromFacade();
          }
        }
    );

    _subscription = _bloc.stream.listen((state){
      Logger().i(state.toString());
      state.mapOrNull(
          hasAuth: (d) async {
            if(d.isOrderUpdated){
              await _loadOrderFromFacade();
            }
          }
      );
    });
  }

  Future<void> _onError(_OrderScreenErrorEvent d, Emitter<OrderScreenState> emit) async {
    emit(OrderScreenState.error(d.message));
  }

  Future<void> _onLoaded(_OrderScreenLoadEvent d, Emitter<OrderScreenState> emit) async {
    emit(OrderScreenState.loaded(d.items));
  }

  Future<void> _onLoadedEmpty(_OrderScreenLoadEmptyEvent d, Emitter<OrderScreenState> emit) async {
    emit(const OrderScreenState.loadedEmpty());
  }
}


