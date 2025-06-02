part of 'app_bar_bloc.dart';

@freezed
class SearchAppBarEvent with _$SearchAppBarEvent {
  const factory SearchAppBarEvent.updateQuery(String query) = _UpdateQueryAppBarEvent;
  const factory SearchAppBarEvent.clearHistory() = _ClearHistoryAppBarEvent;
}