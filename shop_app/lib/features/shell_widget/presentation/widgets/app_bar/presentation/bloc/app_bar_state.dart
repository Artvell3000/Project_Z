part of 'app_bar_bloc.dart';

@freezed
class SearchAppBarState with _$AppBarState {
  const factory SearchAppBarState.history() = _HistoryAppBarState;
  const factory SearchAppBarState.result() = _ResultAppBarState;
  const factory SearchAppBarState.loading() = _LoadingAppBarState;
}
