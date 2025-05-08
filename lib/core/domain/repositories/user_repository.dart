import 'package:fpdart/fpdart.dart';
import 'package:project_z/core/domain/entity/custom_user/custom_user.dart';
import 'package:project_z/core/error/entity/domain_exception.dart';

abstract interface class IUserRepository{
  Future<Either<DomainError,CustomUser>> getUser(String token);
  Future<Either<DomainError,CustomUser>> refreshFullName(String token, String fullName);
  Future<Either<DomainError,CustomUser>> refreshUsername(String token, String username);
  Future<Either<DomainError,CustomUser>> refreshTown(String token, String town);
  Future<Either<DomainError,CustomUser>> refreshDistinct(String token, String distinct);
}