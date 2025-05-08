import 'package:project_z/core/domain/entity/product/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

extension GetCountExtension on List<BasketItem> {
  int countProducts() {
    return fold(0, (sum, item) => sum + item.amount);
  }
}