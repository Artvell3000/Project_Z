import 'package:project_z/core/domain/entity/basket/basket.dart';
import 'package:project_z/core/network/api/entity/basket/basket.dart';
import 'package:project_z/core/network/api/mappers/product_mapper.dart';


extension BasketItemDTOMapper on BasketItemDTO {
  BasketItem toDomain() {
    return BasketItem(
      id: id,
      user: user,
      product: product.toDomain(),
      amount: amount,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
    );
  }
}

extension BasketItemDTOListMapper on List<BasketItemDTO> {
  List<BasketItem> toDomain() {
    return map((el)=> el.toDomain()).toList();
  }
}