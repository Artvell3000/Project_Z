import 'package:shop_domain/domain/entity/search_history/search_history.dart';
import 'package:shop_hive/datasource/search_history/entity/search_history/search_history.dart';

extension HiveSearchHistoryMapping on List<HiveSearchHistoryItem> {
  SearchHistory toDomain() {
    final sortedHiveItems = this.toList()
      ..sort((a, b) => a.order.compareTo(b.order));

    final List<SearchHistoryItem> domainItems = sortedHiveItems.map((hiveItem) {
      return SearchHistoryItem(
        query: hiveItem.query,
        product: hiveItem.product,
      );
    }).toList();
    return SearchHistory(domainItems);
  }
}

extension SearchHistoryMapping on SearchHistory {
  List<HiveSearchHistoryItem> toData() => items.asMap().entries.map((entry) => HiveSearchHistoryItem(
        order: entry.key, 
        query: entry.value.query,
        product: entry.value.product,
      )
    ).toList();
}