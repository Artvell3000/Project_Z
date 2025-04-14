import 'package:fpdart/fpdart.dart';
import 'package:project_z/core/domain/entity/basket/basket.dart';

abstract interface class IBasketRepository{
  Future<Either<Exception, BasketItem>> pop(BasketItem item);
  Future<Either<Exception, BasketItem>> push(BasketItem item);
}