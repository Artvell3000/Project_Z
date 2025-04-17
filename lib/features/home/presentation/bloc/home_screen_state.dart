part of 'home_screen_bloc.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState.loading() = _LoadingState;

  const factory HomeScreenState.loaded({
    required List<Category> categories,
    required List<News> news,
    required List<Product> newProducts,
    required List<Product> specialOffer,
  }) = _LoadedDataState;

  const factory HomeScreenState.error({required String productsError}) = _ErrorState;

  const factory HomeScreenState.moveTo({
    @Default(false) bool toSearchWithCategory,
    int? parentCategoryId
  }) = _MoveToState;
}