
import 'package:shop_domain/domain/entity/entity.dart';
import 'package:shop_network/datasource/entity/basket/basket.dart';
import 'package:shop_network/datasource/mappers/product_mapper.dart';


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