part of 'shell_screen_bloc.dart';

@freezed
class ShellScreenState with _$ShellScreenState {
  const factory ShellScreenState.loaded(String geo, int amountItems) = _LoadedAuthState;

  const factory ShellScreenState.updatedOnlyBasket(int amount) = _UpdatedOnlyBasketState;

  const factory ShellScreenState.addingToBasket(int productId) = _AddingToBasketState;

  const factory ShellScreenState.creatingOrder() = _CreatingOrderState;

  const factory ShellScreenState.updated({
    required String geo,
    required int amountItems,
    int? addedProduct,
    @Default(false) bool isUpdatedBasket,
    @Default(false) bool isUpdatedOrders,
    @Default(false) bool isUpdatedProfile,
    @Default(false) bool isTryingCreateOrder,
}) = _UpdatedAuthState;

  const factory ShellScreenState.needAuth() = _NeedAuthState;

  const factory ShellScreenState.loading() = _LoadingAuthState;

  const factory ShellScreenState.error(
    DomainError e,
  ) = _ErrorAuthState;
}
