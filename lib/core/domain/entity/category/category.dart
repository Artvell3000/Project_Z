import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class CategoryList with _$CategoryList {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CategoryList({
    required int count,
    String? next,
    String? previous,
    required List<Category> results,
  }) = _CategoryList;

  factory CategoryList.fromJson(Map<String, dynamic> json) =>
      _$CategoryListFromJson(json);
}

@freezed
class Category with _$Category {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Category({
    required int id,
    @JsonKey(name: 'mobile_image',) String? mobileImage,
    @JsonKey(
      name: 'name',
    )
    required String name,
    @JsonKey(
      name: 'description',
    )
    required String description,
    @JsonKey() String? image,
    @JsonKey(
      name: 'slug',
    )
    required String slug,
    @JsonKey(name: 'created_at')
    required DateTime createdAt,
    @JsonKey(name: 'updated_at')
    required DateTime updatedAt,
    @JsonKey(name: 'subcategory') int? subcategoryId,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}