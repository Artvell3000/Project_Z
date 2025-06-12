import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_network/network/entity/product/product.dart';


part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class PaginatedOrderItemsDTO with _$PaginatedOrderItemsDTO {
  const factory PaginatedOrderItemsDTO({
    required int count,
    String? next,
    String? previous,
    required List<OrderDTO> results,
  }) = _PaginatedOrderItemsDTO;

  factory PaginatedOrderItemsDTO.fromJson(Map<String, dynamic> json) =>
      _$PaginatedOrderItemsDTOFromJson(json);
}

@freezed
class OrderCompanion with _$OrderCompanion{
  const factory OrderCompanion({
    required int user,
  }) = _OrderCompanion;

  factory OrderCompanion.fromJson(Map<String, dynamic> json) => _$OrderCompanionFromJson(json);
}

@freezed
class OrderDTO with _$OrderDTO {
  const factory OrderDTO({
    required int id,
    required String userPhone,
    required List<OrderItemDTO> items,
    required int totalPrice,
    required String status, //Bekor qilindi, Jarayonda, Yetkazib berildi - возможные статусы
    required String createdAt,
    required String updatedAt,
    required int user,
  }) = _OrderDTO;

  factory OrderDTO.fromJson(Map<String, dynamic> json) => _$OrderDTOFromJson(json);
}

@freezed
class OrderItemDTO with _$OrderItemDTO {
  const factory OrderItemDTO({
    required int id,
    required ProductDTO product,
    required int amount,
    required String createdAt,
    required String updatedAt,
    required int order,
  }) = _OrderItemDTO;

  factory OrderItemDTO.fromJson(Map<String, dynamic> json) =>
      _$OrderItemDTOFromJson(json);
}