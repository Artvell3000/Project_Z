part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.loading() = _Loading;
  const factory ProductsState.loaded(ProductList products) = _Loaded;
  const factory ProductsState.error(String message) = _Error;
}