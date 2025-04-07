import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:project_z/core/domain/entity/tokens/tokens.dart';

abstract interface class ITokenRepository{
  // @factoryMethod
  // factory ITokenRepository() = _TokenRepositoryImpl;

  Future<Either<Exception, AuthTokens?>> find();

  Future<Exception?> save(AuthTokens tokens);
}