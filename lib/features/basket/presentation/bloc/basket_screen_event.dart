part of 'basket_screen_bloc.dart';

@freezed
class BasketScreenEvent with _$BasketScreenEvent {

  const factory BasketScreenEvent.init() = _BasketScreenInitEvent;

  const factory BasketScreenEvent.refresh() = _BasketScreenRefreshEvent;

  const factory BasketScreenEvent.removeItem(int itemId) = _BasketScreenRemoveItemEvent;

  const factory BasketScreenEvent.updateQuantity(int itemId, int amount) = _BasketScreenUpdateQuantityEvent;
}

