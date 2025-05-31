import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:shop_domain/domain/entity/tokens/tokens.dart';
import 'package:shop_domain/domain/repositories/token_repository.dart';
import 'package:shop_hive/datasource/tokens/mapper/token_mapper.dart';
import 'package:shop_hive/datasource/tokens/service/hive_tokens_service.dart';

class HiveTokensRepository implements ITokenRepository {
  HiveTokensRepository(this._loader);
  final HiveTokenService _loader;

  @override
  Future<Either<Exception, AuthTokens?>> find() async {
    try{
      final result = await _loader.find();
      return Right(result?.toDomainNullable());
    }on HiveError catch (e) {
      return Left(Exception('Hive error: ${e.message}'));
    } catch (e) {
      return Left(Exception('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Exception,void>> save(AuthTokens tokens) async {
    try{
      return Right(await _loader.save(tokens.toHive()));
    }on HiveError catch (e) {
      return Left(Exception('Hive error: ${e.message}'));
    } catch (e) {
      return Left(Exception('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> clear() async {
    try{
      return Right(await _loader.clear());
    }on HiveError catch (e) {
      return Left(Exception('Hive error: ${e.message}'));
    } catch (e) {
      return Left(Exception('Unexpected error: $e'));
    }
  }
}