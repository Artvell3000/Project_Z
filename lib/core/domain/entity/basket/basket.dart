import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:project_z/core/domain/entity/product/product.dart';

part 'basket.freezed.dart';
part 'basket.g.dart';

@freezed
class PaginatedBasketItems with _$PaginatedBasketItems {
  const factory PaginatedBasketItems({
    @JsonKey(name: 'count') required int count,
    @JsonKey(name: 'next') String? next,
    @JsonKey(name: 'previous') String? previous,
    @JsonKey(name: 'results') required List<BasketItem> results,
  }) = _PaginatedBasketItems;

  factory PaginatedBasketItems.fromJson(Map<String, dynamic> json) =>
      _$PaginatedBasketItemsFromJson(json);
}

@freezed
class BasketItem with _$BasketItem {
  const factory BasketItem({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'user') required int user,
    @JsonKey(name: 'product') required Product product,
    @JsonKey(name: 'product_id') required int productId,
    @JsonKey(name: 'amount') required int amount,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _BasketItem;

  factory BasketItem.fromJson(Map<String, dynamic> json) =>
      _$BasketItemFromJson(json);
}