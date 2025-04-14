import 'package:fpdart/src/either.dart';
import 'package:project_z/core/domain/entity/basket/basket.dart';
import 'package:project_z/core/domain/repositories/basket_repository.dart';

class ApiBasketRepository implements IBasketRepository{
  @override
  Future<Either<Exception, BasketItem>> pop(BasketItem item) {
    // TODO: implement pop
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, BasketItem>> push(BasketItem item) {
    // TODO: implement push
    throw UnimplementedError();
  }

}