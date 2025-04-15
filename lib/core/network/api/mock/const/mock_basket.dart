import 'package:project_z/core/domain/entity/basket/basket.dart';
import 'package:project_z/core/network/api/mock/const/mock_products.dart';

final mockPaginatedBasketItems = PaginatedBasketItems(
  count: 3,
  next: null,
  previous: null,
  results: [
    BasketItem(
      id: 1,
      user: 1,
      product: mockProducts.results[0], // Используем первый моковый продукт
      productId: mockProducts.results[0].id,
      amount: 2,
      createdAt: DateTime.now().subtract(const Duration(days: 2)).toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    ),
    BasketItem(
      id: 2,
      user: 1,
      product: mockProducts.results[1], // Второй моковый продукт
      productId: mockProducts.results[1].id,
      amount: 1,
      createdAt: DateTime.now().subtract(const Duration(days: 1)).toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    ),
    BasketItem(
      id: 3,
      user: 1,
      product: mockProducts.results[2], // Третий моковый продукт
      productId: mockProducts.results[2].id,
      amount: 3,
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    ),
  ],
);