import 'package:fpdart/fpdart.dart';
import 'package:project_z/core/domain/entity/search_history/search_history.dart';

abstract interface class ISearchHistoryRepository{
  Future<Either<Exception, SearchHistory>> get();
  Future<Either<Exception, void>> add(String query);
  Future<Either<Exception, void>> clear();
}