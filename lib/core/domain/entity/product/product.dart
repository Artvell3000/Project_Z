import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class ProductImage with _$ProductImage {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ProductImage({
    required int id,
    required String image,
    required int product,
  }) = _ProductImage;

  factory ProductImage.fromJson(Map<String, dynamic> json) =>
      _$ProductImageFromJson(json);
}

@freezed
class Product with _$Product {
  const Product._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Product({
    required int id,
    required List<ProductImage> images,
    required String name,
    required Map<String, String> description,
    required Map<String, String> characteristics,
    required String price,
    required String discount,
    required int quantity,
    @JsonKey(name: 'product_code') required int productCode,
    required String? status,
    required String slug,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required int? subcategory,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  // Метод для расчёта итоговой цены
  double get finalPrice {
    final priceValue = double.tryParse(price) ?? 0.0;
    final discountValue = double.tryParse(discount) ?? 0.0;
    return priceValue * (1 - discountValue / 100);
  }

  // Форматированная строка с итоговой ценой
  String get formattedFinalPrice {
    return finalPrice.toStringAsFixed(2); // 2 знака после запятой
  }
}

@freezed
class ProductList with _$ProductList {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ProductList({
    required int count,
    required String? next,
    required String? previous,
    required List<Product> results,
  }) = _ProductList;

  factory ProductList.fromJson(Map<String, dynamic> json) =>
      _$ProductListFromJson(json);
}