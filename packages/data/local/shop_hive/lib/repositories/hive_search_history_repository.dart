import 'package:fpdart/src/either.dart';
import 'package:hive/hive.dart';
import 'package:shop_domain/domain/entity/search_history/search_history.dart';
import 'package:shop_domain/domain/repositories/search_history_repository.dart';
import 'package:shop_hive/datasource/search_history/mapper/search_history_mapper.dart';
import 'package:shop_hive/datasource/search_history/service/hive_search_history_service.dart';

class HiveSearchHistoryRepository implements ISearchHistoryRepository {
  HiveSearchHistoryRepository(this._loader);
  final HiveSearchHistoryService _loader;

  @override
  Future<Either<Exception, void>> save(SearchHistory history) async {
    try {
      await _loader.save(history.toData());
      return const Right(null);
    } on HiveError catch (e) {
      return Left(Exception('Hive error: ${e.message}'));
    } catch (e) {
      return Left(Exception('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> clear() async {
    try {
      await _loader.clear();
      return const Right(null);
    } on HiveError catch (e) {
      return Left(Exception('Hive error: ${e.message}'));
    } catch (e) {
      return Left(Exception('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Exception, SearchHistory>> get() async {
    try {
      return Right((await _loader.find()).toDomain());
    } on HiveError catch (e) {
      return Left(Exception('Hive error: ${e.message}'));
    } catch (e) {
      return Left(Exception('Unexpected error: $e'));
    }
  }
}
