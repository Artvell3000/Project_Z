import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_history.freezed.dart';

@freezed
class SearchHistory with _$SearchHistory {
  const factory SearchHistory({
    required List<String> items
  }) = _SearchHistory;
}