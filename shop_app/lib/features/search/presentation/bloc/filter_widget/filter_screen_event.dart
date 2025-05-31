part of 'filter_screen_bloc.dart';


@freezed
class FilterScreenEvent with _$FilterScreenEvent {
  const factory FilterScreenEvent.init() = _InitFilter;
  const factory FilterScreenEvent.loadingSubcategories(Category parent) = _LoadingWithSubCategories;
  const factory FilterScreenEvent.loadingMainCategories() = _LoadingWithMainCategories;
}
