part of 'search_screen_bloc.dart';

@freezed
class SearchScreenState with _$SearchScreenState {
  const factory SearchScreenState.loading() = _LoadingState;

  const factory SearchScreenState.loaded({
    required List<Product> products,
    required int quantity,
    Category? enabled,
    required Map<Category, List<Category>> struct,
    String? status,
  }) = _LoadedState;

  const factory SearchScreenState.error({
    required String error,
  }) = _ErrorState;
}