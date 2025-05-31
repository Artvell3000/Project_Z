import 'package:fpdart/fpdart.dart' as fp;
import 'package:shop_domain/domain/entity/order/order.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';

abstract interface class IOrderRepository {
  Future<fp.Either<DomainError, PageOrder>> getByPage(String token, {int? page});
  Future<fp.Either<DomainError, void>> create(String token);
}
