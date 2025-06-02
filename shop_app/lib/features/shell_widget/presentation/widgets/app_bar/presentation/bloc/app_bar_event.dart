part of 'app_bar_bloc.dart';

@freezed
class SearchAppBarEvent with _$AppBarEvent {
  const factory SearchAppBarEvent.init() = _InitAppBarEvent;
  const factory SearchAppBarEvent.updateQuery() = _UpdateQueryAppBarEvent;
  const factory SearchAppBarEvent.clearHistory() = _ClearHistoryAppBarEvent;
}