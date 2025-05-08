import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:project_z/core/domain/entity/tokens/tokens.dart';
import 'package:project_z/core/domain/repositories/token_repository.dart';
import 'package:project_z/data/datasource/tokens/mapper/token_mapper.dart';
import 'package:project_z/data/datasource/tokens/service/hive_tokens_service.dart';

@Injectable(as: ITokenRepository)
class HiveTokensRepository implements ITokenRepository {
  HiveTokensRepository(this._loader);
  final HiveTokenService _loader;

  @override
  Future<Either<Exception, AuthTokens?>> find() async {
    try{
      final result = await _loader.find();
      return Right(result.toDomainNullable());
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