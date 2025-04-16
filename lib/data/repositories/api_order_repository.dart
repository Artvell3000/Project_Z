import 'package:fpdart/src/either.dart';
import 'package:project_z/core/domain/entity/order/order.dart';
import 'package:project_z/core/domain/repositories/order_repository.dart';

class ApiOrderRepository implements IOrderRepository{
  @override
  Future<Either<Exception, PaginatedOrderItems>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
}