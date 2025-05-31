import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const Product._();

  const factory Product({
    required int id,
    required List<String> images,
    required String name,
    required Map<String, String> description,
    required Map<String, String> characteristics,
    required double price,
    required double discount,
    required int quantity,
    required int productCode,
    required String? status,
    required String slug,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int? subcategory,
  }) = _Product;

  double get finalPrice => price * (1 - discount / 100);

  String get formattedFinalPrice => finalPrice.toStringAsFixed(2);

  String get formattedPrice => price.toStringAsFixed(2);

  String? get formattedStatus{
    if(status == null) return null;
    final formatted = status!
        .replaceAll('_', ' ')
        .trim();

    return formatted.isNotEmpty
        ? formatted[0].toUpperCase() + formatted.substring(1).toLowerCase()
        : '';
  }
}

@freezed
class ProductPage with _$ProductPage {
  const ProductPage._();

  const factory ProductPage({
    required int count,
    required int? nextPage,
    required int? prevPage,
    required List<Product> results,
  }) = _ProductPage;

  bool get isLast => (nextPage == null);
  bool get isFirst => (prevPage == null);
}
