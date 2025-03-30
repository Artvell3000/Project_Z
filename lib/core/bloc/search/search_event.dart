part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.loaded(
  {required ProductList productList,required CategoryList categoryList}
      ) = _Loaded;

  const factory SearchEvent.loadedWithError({
    required String error
  }) = _LoadedWithError;

  const factory SearchEvent.searchByStatus({required String status}) = _searchByStatus;

  const factory SearchEvent.searchByCategoriesAndPrice(
      {double? from,
      double? to,
      List<Category>? categories}) = _searchByCategoriesAndPrice;
}
