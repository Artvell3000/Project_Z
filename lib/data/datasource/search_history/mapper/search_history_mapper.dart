import 'package:project_z/core/domain/entity/search_history/search_history.dart';
import 'package:project_z/data/datasource/search_history/entity/search_history/search_history.dart';

extension HiveSearchHistoryMapping on HiveSearchHistory {
  SearchHistory toDomain() {
    return SearchHistory(items: items);
  }
}

extension SearchHistoryMapping on SearchHistory {
  HiveSearchHistory toData() {
    return HiveSearchHistory(items: items);
  }
}