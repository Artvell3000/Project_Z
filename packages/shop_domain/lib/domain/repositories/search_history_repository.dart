import 'package:fpdart/fpdart.dart';
import 'package:shop_domain/domain/entity/search_history/search_history.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';

abstract interface class ISearchHistoryRepository{
  Future<Either<DomainError, List<SearchHistoryItem>>> get();
  Future<Either<DomainError, void>> save(List<SearchHistoryItem> history);
  Future<Either<DomainError, void>> clear();
}