import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_history.freezed.dart';

@freezed
class SearchHistoryItem with _$SearchHistoryItem{
  const factory SearchHistoryItem({
    int? product,
    required String query
  }) = _SearchHistoryItem;
}

extension SearchHistory on List<SearchHistoryItem>{
  int get historyLength => 10;

  void addHistoryItem({int? product, required String query}){
    insert(0, SearchHistoryItem(
      product: product,
      query: query,
    ));

    if (length > historyLength) {
      removeLast();
    }
  }
}