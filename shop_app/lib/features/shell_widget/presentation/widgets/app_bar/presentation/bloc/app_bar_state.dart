part of 'app_bar_bloc.dart';

@freezed
class SearchAppBarState with _$SearchAppBarState {
  const factory SearchAppBarState.searching() = _SearchingHistoryAppBarState;
  const factory SearchAppBarState.result({
    required List<String> names, 
    required List<int> ids,
    required bool isSearchHistory
    }) = _ResultAppBarState;
}
