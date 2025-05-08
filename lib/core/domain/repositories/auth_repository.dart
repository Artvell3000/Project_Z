import 'package:fpdart/fpdart.dart';
import 'package:project_z/core/domain/entity/custom_user/custom_user.dart';
import 'package:project_z/core/domain/entity/tokens/tokens.dart';
import 'package:project_z/core/error/entity/domain_exception.dart';

abstract interface class IAuthRepository{
  Future<Either<DomainError, String>> sendCode(String username);
  Future<Either<DomainError, AuthTokens>> verifyCode(String username,String code);
}