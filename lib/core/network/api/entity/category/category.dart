import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.freezed.dart';

part 'category.g.dart';

@freezed
class PaginatedCategoryDTO with _$PaginatedCategoryDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PaginatedCategoryDTO({
    required int count,
    String? next,
    String? previous,
    required List<CategoryDTO> results,
  }) = _PaginatedCategoryDTO;

  factory PaginatedCategoryDTO.fromJson(Map<String, dynamic> json) => _$PaginatedCategoryDTOFromJson(json);
}

@freezed
class CategoryDTO with _$CategoryDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CategoryDTO({
    required int id,
    String? mobileImage,
    required String name,
    required String description,
    String? image,
    required String slug,
    required String createdAt,
    required String updatedAt,
    int? subcategory,
  }) = _CategoryDTO;

  factory CategoryDTO.fromJson(Map<String, dynamic> json) => _$CategoryDTOFromJson(json);
}
