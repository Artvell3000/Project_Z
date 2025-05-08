part of 'shell_screen_bloc.dart';

@freezed
class ShellScreenEvent with _$ShellScreenEvent {
  const factory ShellScreenEvent.init() = _InitAuthEvent;

  const factory ShellScreenEvent.addToBasket(int productId) = _AddToBasketEvent;

  const factory ShellScreenEvent.createOrder() = _CreateOrderEvent;

  const factory ShellScreenEvent.updateBasket(List<BasketItem> items) = _UpdateBasketEvent;

  const factory ShellScreenEvent.error(DomainError e) = _ErrorAuthEvent;
}
