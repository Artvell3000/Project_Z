import 'package:fpdart/fpdart.dart';
import 'package:shop_domain/domain/entity/tokens/tokens.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';

abstract interface class IAuthRepository{
  Future<Either<DomainError, String>> sendCode(String username);
  Future<Either<DomainError, AuthTokens>> verifyCode(String username,String code);
}