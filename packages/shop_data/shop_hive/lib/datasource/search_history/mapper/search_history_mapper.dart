import 'package:fpdart/fpdart.dart';
import 'package:shop_domain/domain/entity/search_history/search_history.dart';
import 'package:shop_hive/datasource/search_history/entity/search_history/search_history.dart';

extension HiveSearchHistoryMappingToDomain on List<HiveSearchHistoryItem> {
  List<SearchHistoryItem> toDomain() {
    final sortedHiveItems = this.toList()
      ..sort((a, b) => a.order.compareTo(b.order));

    return sortedHiveItems.map((hiveItem) {
      return SearchHistoryItem(
        query: hiveItem.query,
        product: hiveItem.product,
      );
    }).toList();
  }
}

extension SearchHistoryItemsMappingToDTO on List<SearchHistoryItem>{
  List<HiveSearchHistoryItem> toDTO()=> mapWithIndex((el, i) => HiveSearchHistoryItem(order: i, product: el.product, query: el.query)).toList();
}