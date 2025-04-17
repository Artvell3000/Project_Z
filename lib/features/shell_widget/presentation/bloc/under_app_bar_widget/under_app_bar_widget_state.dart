part of 'under_app_bar_widget_bloc.dart';


@freezed
class UnderAppBarWidgetState with _$UnderAppBarWidgetState {
  const factory UnderAppBarWidgetState.error(String message) = _ErrorUnderAppBarWidgetState;

  const factory UnderAppBarWidgetState.hideSearch() = _HideUnderAppBarWidgetState;

  const factory UnderAppBarWidgetState.showSearch() = _ShowUnderAppBarWidgetState;

  const factory UnderAppBarWidgetState.startSearch(String query) = _StartUnderAppBarWidgetState;
}

