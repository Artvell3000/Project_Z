part of 'basket_screen_bloc.dart';

@freezed
class BasketScreenEvent with _$BasketScreenEvent {

  // Загрузка корзины
  const factory BasketScreenEvent.load() = _BasketScreenLoadEvent;

  const factory BasketScreenEvent.loaded(
      List<BasketItem> items
      ) = _BasketScreenLoadedEvent;

  // Добавление товара
  const factory BasketScreenEvent.addItem({
    required Product product,
    required int quantity,
  }) = _BasketScreenAddItemEvent;

  // Удаление товара
  const factory BasketScreenEvent.removeItem({
    required String productId,
  }) = _BasketScreenRemoveItemEvent;

  // Изменение количества товара
  const factory BasketScreenEvent.updateQuantity({
    required String productId,
    required int newQuantity,
  }) = _BasketScreenUpdateQuantityEvent;

  // Очистка корзины
  const factory BasketScreenEvent.clear() = _BasketScreenClearEvent;

  // Оформление заказа
  const factory BasketScreenEvent.checkout({
    required String userId,
    required String deliveryAddress,
  }) = _BasketScreenCheckoutEvent;
}

