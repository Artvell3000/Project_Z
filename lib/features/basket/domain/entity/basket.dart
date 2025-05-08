import 'package:project_z/core/domain/entity/basket/basket.dart';

class Basket {
  Basket(this._items) {
    _update();
  }

  late int _fullAmount;
  late double _fullPrice;
  late double _fullPriceWithDiscount;
  final List<BasketItem> _items;

  // Геттеры
  int get fullAmount => _fullAmount;
  double get fullPrice => _fullPrice;
  double get fullPriceWithDiscount => _fullPriceWithDiscount;
  List<BasketItem> get items => _items;
  bool get isEmpty => _items.isEmpty;

  // Приватные методы для расчетов
  void _calculateFullAmount() {
    _fullAmount = _items.fold(0, (sum, item) => sum + item.amount);
  }

  void _calculateFullPrice() {
    _fullPrice = _items.fold(
      0.0,
          (sum, item) => sum + (item.product.price * item.amount),
    );
  }

  void _calculateFullPriceWithDiscount() {
    _fullPriceWithDiscount = _items.fold(
      0.0,
          (sum, item) => sum + (item.product.finalPrice * item.amount),
    );
  }

  void _update(){
    _calculateFullAmount();
    _calculateFullPrice();
    _calculateFullPriceWithDiscount();
  }

  // Метод для добавления товара в корзину
  void addItem(BasketItem item) {
    _items.add(item);
    _update();
  }

  // Метод для удаления товара из корзины
  void removeItem(BasketItem item) {
    _items.remove(item);
    _update();
  }

  void removeItemById(int id) {
    _items.removeWhere((item) => item.id == id);
    _update();
  }

  BasketItem updateItemById(int id, int amount) {
    int index = _items.indexWhere((item) => item.id == id);
    _items[index] = _items[index].copyWith(amount: amount);
    _update();
    return _items[index];
  }
}
