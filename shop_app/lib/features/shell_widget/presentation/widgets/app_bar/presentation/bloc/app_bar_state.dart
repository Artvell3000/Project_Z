part of 'app_bar_bloc.dart';

@freezed
class AppBarState with _$AppBarState {
  const factory AppBarState.base() = _BaseAppBarState;
  const factory AppBarState.showSearch() = _ShowSearchState;
  const factory AppBarState.showSearchAndHistory() = _ShowSearchAndHistoryState;
  const factory AppBarState.showSearchAndResults() = _ShowSearchAndResults;
}
