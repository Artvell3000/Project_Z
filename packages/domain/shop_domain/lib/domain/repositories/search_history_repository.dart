import 'package:fpdart/fpdart.dart';
import 'package:shop_domain/domain/entity/search_history/search_history.dart';

abstract interface class ISearchHistoryRepository{
  Future<Either<Exception, SearchHistory>> get();
  Future<Either<Exception, void>> save(SearchHistory history);
  Future<Either<Exception, void>> clear();
}