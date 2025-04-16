part of 'basket_screen_bloc.dart';

@freezed
class BasketScreenEvent with _$BasketScreenEvent {

  const factory BasketScreenEvent.init() = _BasketScreenInitEvent;
  const factory BasketScreenEvent.error(String message) = _BasketScreenErrorEvent;
  const factory BasketScreenEvent.load() = _BasketScreenLoadEvent;

  const factory BasketScreenEvent.loaded(
      Map<Category,List<BasketItem>> items
      ) = _BasketScreenLoadedEvent;

  const factory BasketScreenEvent.loadedEmpty() = _BasketScreenLoadedEmptyEvent;

  const factory BasketScreenEvent.removeItem(int itemId) = _BasketScreenRemoveItemEvent;

  const factory BasketScreenEvent.incrementQuantity(int itemId) = _BasketScreenIncrementQuantityEvent;

  const factory BasketScreenEvent.decrementQuantity(int itemId) = _BasketScreenDecrementQuantityEvent;

  // Оформление заказа
  const factory BasketScreenEvent.checkout({
    required String userId,
    required String deliveryAddress,
  }) = _BasketScreenCheckoutEvent;
}

