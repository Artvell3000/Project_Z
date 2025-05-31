import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_domain/domain/entity/product/product.dart';

part 'order.freezed.dart';

enum OrderStatus{
  cancelled,
  inProgress,
  delivered,
}

@freezed
class PageOrder with _$PageOrder {
  const factory PageOrder({
    required int count,
    int? next,
    int? previous,
    required List<Order> results,
  }) = _PageOrder;
}

@freezed
class Order with _$Order {
  const Order._();

  const factory Order({
    required int id,
    required String userPhone,
    required List<OrderItem> items,
    required double totalPrice,
    required OrderStatus status,
    required String createdAt,
    required String updatedAt,
    required int user,
  }) = _Order;

  String get formattedStatus {
    switch (status) {
      case OrderStatus.delivered:
        return 'Yetkazib berildi';
      case OrderStatus.cancelled:
        return 'Bekor qilindi';
      case OrderStatus.inProgress:
        return 'Jarayonda';
    }
  }
}

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required int id,
    required Product product,
    required int amount,
    required String createdAt,
    required String updatedAt,
    required int order,
  }) = _OrderItem;
}