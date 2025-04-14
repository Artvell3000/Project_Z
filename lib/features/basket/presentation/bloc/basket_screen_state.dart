part of 'basket_screen_bloc.dart';

@freezed
class BasketScreenState with _$BasketScreenState {
  // Загрузка данных
  const factory BasketScreenState.loading() = _BasketScreenLoadingState;

  // Успешная загрузка корзины
  const factory BasketScreenState.loaded({
    required List<BasketItem> items,
    required int amount,
  }) = _BasketScreenLoadedState;

  const factory BasketScreenState.loadedEmpty() = _BasketScreenLoadedEmptyState;

  // Ошибка (например, сеть или сервер)
  const factory BasketScreenState.error(String message) = _BasketScreenErrorState;

  // Состояние после успешного оформления заказа
  const factory BasketScreenState.changeSelect(int itemId) = _BasketScreenCheckoutSuccessState;

  // Ошибка оформления заказа
  const factory BasketScreenState.checkoutError(String message) = _BasketScreenCheckoutErrorState;

}

