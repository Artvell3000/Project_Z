part of 'home_screen_bloc.dart';

@freezed
class HomeScreenEvent with _$HomeScreenEvent {
  const factory HomeScreenEvent.init() = _InitEvent;

  const factory HomeScreenEvent.refresh() = _RefreshEvent;
}
