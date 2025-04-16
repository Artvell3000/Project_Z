import 'package:project_z/core/domain/entity/order/order.dart';
import 'package:project_z/core/network/api/mock/const/mock_products.dart';


final paginatedOrderItems = PaginatedOrderItems(
  count: 3,
  next: null,
  previous: null,
  results: [
    OrderItem(
      id: 101,
      product: mockProducts.results[0], // Using the first product from the mock list
      amount: 2,
      createdAt: DateTime.now().subtract(const Duration(days: 5)).toIso8601String(),
      updatedAt: DateTime.now().subtract(const Duration(days: 3)).toIso8601String(),
      order: 1,
    ),
    OrderItem(
      id: 102,
      product: mockProducts.results[3], // Using the fourth product from the mock list
      amount: 1,
      createdAt: DateTime.now().subtract(const Duration(days: 10)).toIso8601String(),
      updatedAt: DateTime.now().subtract(const Duration(days: 7)).toIso8601String(),
      order: 1,
    ),
    OrderItem(
      id: 103,
      product: mockProducts.results[6], // Using the seventh product from the mock list
      amount: 3,
      createdAt: DateTime.now().subtract(const Duration(days: 15)).toIso8601String(),
      updatedAt: DateTime.now().subtract(const Duration(days: 12)).toIso8601String(),
      order: 2,
    ),
  ],
);