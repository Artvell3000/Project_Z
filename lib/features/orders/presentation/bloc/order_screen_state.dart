part of 'order_screen_bloc.dart';

@freezed
class OrderScreenState with _$OrderScreenState {

  const factory OrderScreenState.loading() = _OrderScreenLoadingState;

  const factory OrderScreenState.needAuth() = _OrderScreenNeedAuthState;

  const factory OrderScreenState.loaded({
    required List<Order> items,
    required int page,
    required bool isAllItems,
}) = _OrderScreenLoadedState;

  const factory OrderScreenState.error(DomainError e) = _OrderScreenErrorState;
}

