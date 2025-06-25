import 'package:fpdart/fpdart.dart';
import 'package:shop_domain/domain/entity/custom_user/custom_user.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';

abstract class IUserRepository {
  Future<Either<DomainError,CustomUser>> getUser();
  Future<Either<DomainError,CustomUser>> refreshFullName(String fullName);
  Future<Either<DomainError,CustomUser>> refreshUsername(String username);
  Future<Either<DomainError,CustomUser>> refreshTown(String town);
  Future<Either<DomainError,CustomUser>> refreshDistinct(String distinct);
}