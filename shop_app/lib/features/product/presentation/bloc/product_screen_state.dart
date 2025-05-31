part of 'product_screen_bloc.dart';

@freezed
class ProductScreenState with _$ProductScreenState{
  const factory ProductScreenState.loading() = _Loading;

  const factory ProductScreenState.loadedProducts({
    required Product product,
    required List<Product> newProducts,
  }) = _LoadedProduct;

  const factory ProductScreenState.errorProducts({
    required String productError,
  }) = _ErrorProduct;
}
