part of 'under_app_bar_widget_bloc.dart';

@freezed
class UnderAppBarWidgetEvent with _$UnderAppBarWidgetEvent {
  const factory UnderAppBarWidgetEvent.error(Exception e) = _ErrorUnderAppBarWidgetEvent;

  const factory UnderAppBarWidgetEvent.hideSearch() = _HideUnderAppBarWidgetEvent;

  const factory UnderAppBarWidgetEvent.showSearch() = _ShowUnderAppBarWidgetEvent;

  const factory UnderAppBarWidgetEvent.startSearch(String query) = _StartUnderAppBarWidgetEvent;
}
