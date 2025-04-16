import 'package:fpdart/fpdart.dart';
import 'package:project_z/core/domain/entity/basket/basket.dart';

abstract interface class IBasketRepository {
  Future<Either<Exception,PaginatedBasketItems>> getBasketList({
    String? search,
    int? page,
    required String token
  });

  Future<Either<Exception,PaginatedBasketItems>> getMyBasketItems({
    String? search,
    int? page,
    required String token
  });

  Future<Either<Exception,BasketItem>> getBasketItem(
      int basketItemId, String token
      );

  Future<Either<Exception,BasketItem>> addToBasket(BasketItemRequest request, String token);

  Future<Either<Exception,BasketItem>> updateBasketItem(
      int basketItemId,
      BasketItemRequest request,
      String token
      );

  Future<Either<Exception,BasketItem>> partialUpdateBasketItem(
      int basketItemId,
      BasketItemRequest request,
      String token
      );

  Future<Either<Exception,void>> removeFromBasket(int basketItemId,String token);
}