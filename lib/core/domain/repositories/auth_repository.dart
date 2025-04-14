import 'package:fpdart/fpdart.dart';
import 'package:project_z/core/domain/entity/custom_user/custom_user.dart';
import 'package:project_z/core/domain/entity/tokens/tokens.dart';

abstract interface class IAuthRepository{
  bool get hasAuth;
  Future<Either<Exception, CustomUser>> refreshUser(CustomUserCompanion newUser);
  Future<Either<Exception,CustomUser>> setTokens(AuthTokens tokens);
  Future<Either<Exception, CustomUser>> getUser();
  Future<Either<Exception, String>> sendCode(String username);
  Future<Either<Exception, AuthTokens>> verifyCode(String username,String code);
}