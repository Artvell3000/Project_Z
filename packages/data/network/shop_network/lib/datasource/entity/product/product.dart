import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class ProductDTO with _$ProductDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ProductDTO({
    required int id,

    String? image1,
    String? image2,
    String? image3,
    String? image4,
    String? image5,

    String? mobileImage1,
    String? mobileImage2,
    String? mobileImage3,
    String? mobileImage4,
    String? mobileImage5,

    required String name,
    required Map<String, String> description,
    required Map<String, String> characteristics,
    required String price,
    required String discount,
    required int quantity,
    required int productCode,
    String? status,
    required String slug,
    required String createdAt,
    required String updatedAt,
    int? subcategory,
  }) = _ProductDTO;

  factory ProductDTO.fromJson(Map<String, dynamic> json) => _$ProductDTOFromJson(json);
}

@freezed
class PaginatedProductDTO with _$PaginatedProductDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PaginatedProductDTO({
    required int count,
    required String? next,
    required String? previous,
    required List<ProductDTO> results,
  }) = _PaginatedProductDTO;

  factory PaginatedProductDTO.fromJson(Map<String, dynamic> json) => _$PaginatedProductDTOFromJson(json);
}
