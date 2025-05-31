part of 'basket_screen_bloc.dart';

@freezed
class BasketScreenState with _$BasketScreenState {
  const factory BasketScreenState.loading() = _BasketScreenLoadingState;

  const factory BasketScreenState.loaded(Basket basket, int countItems) = _BasketScreenLoadedState;

  const factory BasketScreenState.loadedEmpty() = _BasketScreenLoadedEmptyState;

  const factory BasketScreenState.needAuth() = _BasketScreenNeedAuthState;

  const factory BasketScreenState.error(DomainError e) = _BasketScreenErrorState;
}
