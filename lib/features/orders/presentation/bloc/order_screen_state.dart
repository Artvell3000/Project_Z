part of 'order_screen_bloc.dart';

@freezed
class OrderScreenState with _$OrderScreenState {

  const factory OrderScreenState.loading() = _OrderScreenLoadingState;

  const factory OrderScreenState.loaded(List<OrderItem> items) = _OrderScreenLoadedState;

  const factory OrderScreenState.loadedEmpty() = _OrderScreenLoadEmptyState;

  const factory OrderScreenState.error(String message) = _OrderScreenErrorState;
}

