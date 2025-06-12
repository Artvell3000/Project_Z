import 'package:shop_domain/domain/entity/order/order.dart';
import 'package:shop_network/network/entity/order/order.dart';

import 'extract_page_number_function.dart';
import 'product_mapper.dart';

extension OrderItemMapper on OrderItemDTO {
  OrderItem toDomain() {
    return OrderItem(
      id: id,
      product: product.toDomain(),
      amount: amount,
      createdAt: createdAt,
      updatedAt: updatedAt,
      order: order,
    );
  }
}

extension OrderMapper on OrderDTO {
  Order toDomain() {
    return Order(
      id: id,
      userPhone: userPhone,
      items: items.map((item) => item.toDomain()).toList(),
      totalPrice: totalPrice.toDouble(),
      status: _parseOrderStatus(status),
      createdAt: createdAt,
      updatedAt: updatedAt,
      user: user,
    );
  }

  OrderStatus _parseOrderStatus(String status) {
    switch (status) {
      case 'Bekor qilindi':
        return OrderStatus.cancelled;
      case 'Jarayonda':
        return OrderStatus.inProgress;
      case 'Yetkazib berildi':
        return OrderStatus.delivered;
      default:
        throw ArgumentError('Unknown order status: $status');
    }
  }
}

extension PaginatedOrderItemsMapper on PaginatedOrderItemsDTO {
  PageOrder toDomain() {
    return PageOrder(
      count: count,
      next: ExtractPageNumberFunction.body(next),
      previous: ExtractPageNumberFunction.body(previous),
      results: results.map((order) => order.toDomain()).toList(),
    );
  }
}