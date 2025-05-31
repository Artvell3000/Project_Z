part of 'product_screen_bloc.dart';

@freezed
class ProductScreenEvent with _$ProductScreenEvent {

  const factory ProductScreenEvent.loading() = _InitialLoad;

  const factory ProductScreenEvent.productLoaded(Product product, List<Product> newProducts) = _ProductLoaded;

  const factory ProductScreenEvent.productError(String message) = _ProductError;
}
