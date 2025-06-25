import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

@freezed
class CategoryPage with _$CategoryPage {
  const factory CategoryPage({
    required int count,
    int? next,
    int? previous,
    required List<Category> results,
  }) = _CategoryPage;

}

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    String? mobileImage,
    required String name,
    required String description,
    String? image,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? subcategoryId,
  }) = _Category;
}
