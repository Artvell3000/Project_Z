import 'package:fpdart/fpdart.dart';
import 'package:shop_domain/domain/entity/order/order.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';

abstract class IOrderRepository {
  Future<Either<DomainError, PageOrder>> getByPage({int? page});
  Future<Either<DomainError, void>> create();
}
