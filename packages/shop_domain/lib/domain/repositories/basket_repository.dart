import 'package:fpdart/fpdart.dart';
import 'package:shop_domain/domain/entity/basket/basket.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';

abstract class IBasketRepository {
  Future<Either<DomainError,List<BasketItem>>> getMyBasket({int? page});

  Future<Either<DomainError,BasketItem>> addToBasket(int productId);

  Future<Either<DomainError,BasketItem>> updateAmount({required int id,required int productId,required int amount});

  Future<Either<DomainError,void>> remove(int id);
}