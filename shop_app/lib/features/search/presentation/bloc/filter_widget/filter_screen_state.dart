part of 'filter_screen_bloc.dart';

@freezed
class FilterScreenState with _$FilterScreenState {
  const factory FilterScreenState.loading() = _LoadingState;

  const factory FilterScreenState.loaded({
    required List<Category> categories,
    double? from,
    double? to
  }) = _LoadedState;

  const factory FilterScreenState.showingMainCategories(
    List<Category> categories,
  ) = _ShowingMainCategories;

  const factory FilterScreenState.showingSubCategories(
      Category parent,
      List<Category> categories,
      ) = _ShowingSubCategories;

  const factory FilterScreenState.error(
      DomainError e,
      ) = _ErrorState;
}
