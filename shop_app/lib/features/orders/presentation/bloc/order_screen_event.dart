part of 'order_screen_bloc.dart';

@freezed
class OrderScreenEvent with _$OrderScreenEvent {
  const factory OrderScreenEvent.init() = _OrderScreenInitEvent;
  const factory OrderScreenEvent.refresh() = _OrderScreenRefreshEvent;
  const factory OrderScreenEvent.loadMore() = _OrderScreenLoadMoreEvent;
}
