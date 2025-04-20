part of 'order_screen_bloc.dart';

@freezed
class OrderScreenEvent with _$OrderScreenEvent {

  const factory OrderScreenEvent.init() = _OrderScreenInitEvent;
  const factory OrderScreenEvent.error(String message) = _OrderScreenErrorEvent;
  const factory OrderScreenEvent.load(List<Order> items) = _OrderScreenLoadEvent;
  const factory OrderScreenEvent.loadEmpty() = _OrderScreenLoadEmptyEvent;
}
