import 'package:fpdart/fpdart.dart';
import 'package:shop_domain/domain/entity/basket/basket.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';

abstract interface class IBasketRepository {
  Future<Either<DomainError,List<BasketItem>>> getMyBasket(String token, {int? page});

  Future<Either<DomainError,BasketItem>> addToBasket(String token, int productId);

  Future<Either<DomainError,BasketItem>> updateAmount(String token,{required int id,required int productId,required int amount});

  Future<Either<DomainError,void>> remove(String token, int id);
}