part of 'app_bar_bloc.dart';

@freezed
class AppBarEvent with _$AppBarEvent {
  const factory AppBarEvent.init() = _InitAppBarEvent;
  const factory AppBarEvent.startSearch(List<Product> products) = _StartSearchAppBarEvent;
  const factory AppBarEvent.updateSearchResult(List<Product> products) = _UpdateSearchAppBarEvent;
  const factory AppBarEvent.hideSearch() = _HideSearchAppBarEvent;
  const factory AppBarEvent.clearHistory() = _ClearHistoryAppBarEvent;
}