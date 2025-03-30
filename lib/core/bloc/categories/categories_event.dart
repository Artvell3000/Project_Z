part of 'categories_bloc.dart';

@freezed
class CategoriesEvent with _$CategoriesEvent {
  const factory CategoriesEvent.load() = _LoadCategories;
  const factory CategoriesEvent.refresh() = _RefreshCategories;
}