part of 'profile_screen_bloc.dart';

@freezed
class ProfileScreenEvent with _$ProfileScreenEvent {
  const factory ProfileScreenEvent.loaded(CustomUserJson profile) =
      _LoadProfileScreenEvent;

  const factory ProfileScreenEvent.refresh(
    CustomUserJson profile
  ) = _RefreshProfileScreenEvent;

  const factory ProfileScreenEvent.error(
    String message,
  ) = _ErrorProfileScreenEvent;
}
