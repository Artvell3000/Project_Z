import 'package:fpdart/fpdart.dart';
import 'package:project_z/core/domain/entity/order/order.dart';

abstract interface class IOrderRepository {
  Future<Either<Exception, PaginatedOrderItems>> getAll(String token);
}
