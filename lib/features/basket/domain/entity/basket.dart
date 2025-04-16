import 'package:project_z/core/domain/entity/basket/basket.dart';

class BasketController {
  List<BasketItem> _items;

  BasketController(List<BasketItem> initialItems) : _items = List.from(initialItems);

  // Получить текущие элементы корзины
  List<BasketItem> get items => List.unmodifiable(_items);

  // Получить общее количество товаров
  int get totalItems => _items.fold(0, (sum, item) => sum + item.amount);

  // Получить общую стоимость
  double get totalPrice {
    return _items.fold(0.0, (sum, item) {
      final price = double.tryParse(item.product.price) ?? 0;
      final discount = double.tryParse(item.product.discount) ?? 0;
      final discountedPrice = price * (1 - discount / 100);
      return sum + (discountedPrice * item.amount);
    });
  }

  // // Добавить новый товар или увеличить количество существующего
  // void addItem(Product product, {int amount = 1}) {
  //   final existingIndex = _items.indexWhere((item) => item.product.id == product.id);
  //
  //   if (existingIndex >= 0) {
  //     // Товар уже в корзине - увеличиваем количество
  //     final existingItem = _items[existingIndex];
  //     _items[existingIndex] = existingItem.copyWith(
  //       amount: existingItem.amount + amount,
  //       updatedAt: DateTime.now().toIso8601String(),
  //     );
  //   } else {
  //     // Новый товар - добавляем в корзину
  //     final newItem = BasketItem(
  //       id: 2,
  //       user: 1, // Здесь можно передавать реальный ID пользователя
  //       product: product,
  //       productId: product.id,
  //       amount: amount,
  //       createdAt: DateTime.now().toIso8601String(),
  //       updatedAt: DateTime.now().toIso8601String(),
  //     );
  //     _items.add(newItem);
  //   }
  // }

  // Увеличить количество товара на 1
  void incrementItem(String basketItemId) {
    final index = _items.indexWhere((item) => item.id == basketItemId);
    if (index >= 0) {
      final item = _items[index];
      _items[index] = item.copyWith(
        amount: item.amount + 1,
        updatedAt: DateTime.now().toIso8601String(),
      );
    }
  }

  // Уменьшить количество товара на 1 (если количество станет 0 - удалить)
  void decrementItem(String basketItemId) {
    final index = _items.indexWhere((item) => item.id == basketItemId);
    if (index >= 0) {
      final item = _items[index];
      if (item.amount > 1) {
        _items[index] = item.copyWith(
          amount: item.amount - 1,
          updatedAt: DateTime.now().toIso8601String(),
        );
      } else {
        _items.removeAt(index);
      }
    }
  }

  // Удалить товар из корзины
  void removeItem(String basketItemId) {
    _items.removeWhere((item) => item.id == basketItemId);
  }

  // Очистить корзину полностью
  void clear() {
    _items.clear();
  }
}
