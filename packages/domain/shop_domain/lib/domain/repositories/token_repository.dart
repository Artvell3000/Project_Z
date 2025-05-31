import 'package:fpdart/fpdart.dart';
import 'package:shop_domain/domain/entity/tokens/tokens.dart';

abstract interface class ITokenRepository {
  Future<Either<Exception, AuthTokens?>> find();

  Future<Either<Exception,void>> save(AuthTokens tokens);

  Future<Either<Exception, void>> clear();
}
