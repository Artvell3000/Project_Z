part of 'search_screen_bloc.dart';

@freezed
class SearchScreenState with _$SearchScreenState {
  const factory SearchScreenState.loading() = _LoadingState;

  const factory SearchScreenState.loaded({
    required List<Product> products,
    required int quantity,
    required int page,
    required bool isAllProducts
  }) = _LoadedState;

  const factory SearchScreenState.error(
    DomainError e,
  ) = _ErrorState;
}