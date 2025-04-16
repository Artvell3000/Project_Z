import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/core/domain/entity/product/product.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class PaginatedOrderItems with _$PaginatedOrderItems {
  const factory PaginatedOrderItems({
    @JsonKey(name: 'count') required int count,
    @JsonKey(name: 'next') String? next,
    @JsonKey(name: 'previous') String? previous,
    @JsonKey(name: 'results') required List<OrderItem> results,
  }) = _PaginatedOrderItems;

  factory PaginatedOrderItems.fromJson(Map<String, dynamic> json) =>
      _$PaginatedOrderItemsFromJson(json);
}

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'product') required Product product,
    @JsonKey(name: 'amount') required int amount,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'order') required int order,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}