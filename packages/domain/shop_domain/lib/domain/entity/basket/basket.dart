import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_domain/domain/entity/product/product.dart';

part 'basket.freezed.dart';

@freezed
class BasketItem with _$BasketItem {
  const factory BasketItem({
    required int id,
    required int user,
    required Product product,
    required int amount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _BasketItem;
}

extension BasketItemExtension on List<BasketItem> {
  int countProducts() {
    return fold(0, (sum, item) => sum + item.amount);
  }

  String getFullAmount(){
    final s = fold(0.0, (sum, item) => sum + (item.amount * item.product.finalPrice));
    return s.toStringAsFixed(2);
  }
}