import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:project_z/core/domain/entity/entity.dart';

part 'order.freezed.dart';

part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required int id,
    @JsonKey(name: 'user_phone') required String userPhone,
    required List<OrderItem> items,
    @JsonKey(name: 'total_price') required int totalPrice,
    String? status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required int user,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required int id,
    required Product product,
    required int amount,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required int order,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);
}
