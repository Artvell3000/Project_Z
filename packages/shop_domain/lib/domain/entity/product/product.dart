import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money2/money2.dart';

part 'product.freezed.dart';

/// Класс, представляющий товар в системе
/// Использует freezed для генерации иммутабельного класса
@freezed
class Product with _$Product {
  const Product._();

  /// Создает новый экземпляр товара
  /// 
  /// [id] - уникальный идентификатор товара
  /// [images] - список URL изображений товара
  /// [name] - название товара
  /// [description] - описание товара на разных языках (ключ - код языка)
  /// [characteristics] - характеристики товара на разных языках
  /// [price] - базовая цена товара
  /// [discount] - скидка в процентах
  /// [quantity] - количество товара на складе
  /// [productCode] - код товара
  /// [status] - статус товара (может быть null)
  /// [slug] - URL-friendly версия названия товара
  /// [createdAt] - дата создания записи
  /// [updatedAt] - дата последнего обновления
  /// [subcategory] - ID подкатегории (может быть null)
  const factory Product({
    required int id,
    required List<String> images,
    required String name,
    required Map<String, String> description,
    required Map<String, String> characteristics,
    required Money price,
    required double discount,
    required int quantity,
    required int productCode,
    required String? status,
    required String slug,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int? subcategory,
  }) = _Product;

  /// Возвращает финальную цену товара с учетом скидки
  Money get finalPrice => price * (1 - discount / 100);

  /// Возвращает отформатированную финальную цену товара
  String get formattedFinalPrice => finalPrice.toString();

  /// Возвращает отформатированную базовую цену товара
  String get formattedPrice => price.toString();

  /// Возвращает отформатированный статус товара
  /// Преобразует статус из формата snake_case в Title Case
  String? get formattedStatus{
    if(status == null) return null;
    final formatted = status!
        .replaceAll('_', ' ')
        .trim();

    return formatted.isNotEmpty
        ? formatted[0].toUpperCase() + formatted.substring(1).toLowerCase()
        : '';
  }
}

/// Класс, представляющий страницу с результатами поиска товаров
/// Использует freezed для генерации иммутабельного класса
@freezed
class ProductPage with _$ProductPage {
  const ProductPage._();

  /// Создает новый экземпляр страницы с товарами
  /// 
  /// [count] - общее количество товаров
  /// [nextPage] - номер следующей страницы (null если это последняя страница)
  /// [prevPage] - номер предыдущей страницы (null если это первая страница)
  /// [results] - список товаров на текущей странице
  const factory ProductPage({
    required int count,
    required int? nextPage,
    required int? prevPage,
    required List<Product> results,
  }) = _ProductPage;

  /// Проверяет, является ли текущая страница последней
  bool get isLast => (nextPage == null);
  
  /// Проверяет, является ли текущая страница первой
  bool get isFirst => (prevPage == null);
}
