import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money2/money2.dart';
import 'package:shop_domain/domain/entity/product/product.dart';

part 'basket.freezed.dart';

/// Класс, представляющий элемент корзины пользователя
/// Использует freezed для генерации иммутабельного класса
@freezed
class BasketItem with _$BasketItem {
  /// Создает новый экземпляр элемента корзины
  /// 
  /// [id] - уникальный идентификатор элемента корзины
  /// [user] - ID пользователя, которому принадлежит элемент
  /// [product] - товар в корзине
  /// [amount] - количество товара
  /// [createdAt] - дата добавления в корзину
  /// [updatedAt] - дата последнего обновления
  const factory BasketItem({
    required int id,
    required int user,
    required Product product,
    required int amount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _BasketItem;
}

/// Расширение для списка элементов корзины
/// Добавляет методы для работы с коллекцией элементов корзины
extension BasketItemsExtension on List<BasketItem> {
  /// Подсчитывает общее количество товаров в корзине
  /// 
  /// Возвращает сумму количества всех товаров
  int countProducts() {
    return fold(0, (sum, item) => sum + item.amount);
  }

  /// Рассчитывает общую стоимость всех товаров в корзине
  /// 
  /// Возвращает сумму стоимости всех товаров с учетом их количества
  /// и скидок на каждый товар
  Money getFullAmount() {
    return fold(
      Money.fromNum(0, isoCode: 'UZS'), 
      (sum, item) => sum + (item.product.finalPrice * item.amount)
    );
  }

  /// Рассчитывает общую стоимость всех товаров в корзине без учета скидок
  /// 
  /// Возвращает сумму базовой стоимости всех товаров с учетом их количества,
  /// без применения скидок
  Money getFullAmountWithoutDiscount() {
    return fold(
      Money.fromNum(0, isoCode: 'UZS'),
      (sum, item) => sum + (item.product.price * item.amount)
    );
  }
}