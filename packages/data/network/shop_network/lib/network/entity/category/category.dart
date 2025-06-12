import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class PaginatedCategoryDTO with _$PaginatedCategoryDTO {
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
  const factory CategoryDTO({
    required int id,
    String? mobileImage,
    required String name,
    required String description,
    String? image,
    required String createdAt,
    required String updatedAt,
    int? subcategory,
  }) = _CategoryDTO;

  factory CategoryDTO.fromJson(Map<String, dynamic> json) => _$CategoryDTOFromJson(json);
}
