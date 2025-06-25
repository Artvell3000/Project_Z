import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_network/network/entity/product/product.dart';


part 'basket.freezed.dart';
part 'basket.g.dart';

@freezed
class PaginatedBasketItemsDTO with _$PaginatedBasketItemsDTO {
  const factory PaginatedBasketItemsDTO({
    required int count,
    String? next,
    String? previous,
    required List<BasketItemDTO> results,
  }) = _PaginatedBasketItemsDTO;

  factory PaginatedBasketItemsDTO.fromJson(Map<String, dynamic> json) =>
      _$PaginatedBasketItemsDTOFromJson(json);
}

@freezed
class BasketItemDTO with _$BasketItemDTO {
  const factory BasketItemDTO({
    required int id,
    required int user,
    required ProductDTO product,
    required int amount,
    required String createdAt,
    required String updatedAt,
  }) = _BasketItemDTO;

  factory BasketItemDTO.fromJson(Map<String, dynamic> json) =>
      _$BasketItemDTOFromJson(json);
}

@freezed
class BasketItemCompanion with _$BasketItemCompanion {
  const factory BasketItemCompanion({
    ProductDTO? product,
    required int productId,
    int? amount,
  }) = _BasketItemCompanion;

  factory BasketItemCompanion.fromJson(Map<String, dynamic> json) =>
      _$BasketItemCompanionFromJson(json);
}