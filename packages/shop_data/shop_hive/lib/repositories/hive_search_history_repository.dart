import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_domain/domain/entity/search_history/search_history.dart';
import 'package:shop_domain/domain/repositories/search_history_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';
import 'package:shop_hive/datasource/search_history/mapper/search_history_mapper.dart';
import 'package:shop_hive/datasource/search_history/service/hive_search_history_service.dart';
import 'package:shop_hive/domain/domain_error_mapper.dart';

@Injectable(as: ISearchHistoryRepository)
class HiveSearchHistoryRepository implements ISearchHistoryRepository {
  HiveSearchHistoryRepository(this._loader);
  final HiveSearchHistoryService _loader;

  @override
  Future<Either<DomainError, void>> save(List<SearchHistoryItem> history) async {
    try {
      await _loader.save(history.toDTO());
      return const Right(null);
    } on Exception catch (e) {
      return Left(DomainErrorMapper.map(e));
    }
  }

  @override
  Future<Either<DomainError, void>> clear() async {
    try {
      return Right(await _loader.clear());
    } on Exception catch (e) {
      return Left(DomainErrorMapper.map(e));
    }
  }

  @override
  Future<Either<DomainError, List<SearchHistoryItem>>> get() async {
    try {
      return Right((await _loader.find()).toDomain());
    } on Exception catch (e) {
      return Left(DomainErrorMapper.map(e));
    }
  }
}
