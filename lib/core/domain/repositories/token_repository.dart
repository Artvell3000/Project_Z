import 'package:fpdart/fpdart.dart';
import 'package:project_z/core/domain/entity/tokens/tokens.dart';

abstract interface class ITokenRepository {
  Future<Either<Exception, AuthTokens?>> find();

  Future<Exception?> save(AuthTokens tokens);
}
