import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_history.freezed.dart';

class SearchHistory{
  SearchHistory(this._items);

  final List<SearchHistoryItem> _items;

  List<SearchHistoryItem> get items => _items.map((el) => el.copyWith()).toList();

  void add(String query, {int? product}){
    final newItem = SearchHistoryItem(query: query, product: product);

    for(int i=0;i<_items.length;i++){
      if(_items[i] == newItem){
        _items.removeAt(i);
        i--;
      }
    }

    _items.insert(0, newItem);

    if(_items.length > 10){
      _items.removeAt(11);
    }

  }
}

@freezed
class SearchHistoryItem with _$SearchHistoryItem{
  const factory SearchHistoryItem({
    int? product,
    required String query
  }) = _SearchHistoryItem;
}