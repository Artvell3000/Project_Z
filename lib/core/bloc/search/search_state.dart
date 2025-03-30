part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.loading() = _LoadingState;
  const factory SearchState.loaded(ProductList products, CategoryList categories) = _LoadedState;
  const factory SearchState.error(String message) = _ErrorState;
}
