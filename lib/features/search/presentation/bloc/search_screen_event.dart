part of 'search_screen_bloc.dart';

@freezed
class SearchScreenEvent with _$SearchScreenEvent {
  const factory SearchScreenEvent.loading({double? from, double? to, List<Category>? categories, String? status}) = _LoadingSearch;

  const factory SearchScreenEvent.loaded({
      required List<Product> products,
      required int quantity,
      required List<Category> enabled,
      required Map<Category, List<Category>> struct,
      required String? status
  }) = _LoadedSearch;

  const factory SearchScreenEvent.error({
    required String error,
  }) = _ErrorSearch;
}
