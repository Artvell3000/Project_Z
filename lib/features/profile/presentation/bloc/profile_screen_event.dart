part of 'profile_screen_bloc.dart';

@freezed
class ProfileScreenEvent with _$ProfileScreenEvent {
  const factory ProfileScreenEvent.init() = _InitEvent;

  const factory ProfileScreenEvent.loadNewUser(CustomUser? user) = _LoadNewUserEvent;

  const factory ProfileScreenEvent.loadNewUserWithError(String message) = _LoadNewUserWithErrorEvent;

  const factory ProfileScreenEvent.refreshFullName(String name) = _RefreshFullNameEvent;

  const factory ProfileScreenEvent.refreshUsername(String username) = _RefreshUsernameEvent;

  const factory ProfileScreenEvent.refreshTown(
    String town,
  ) = _RefreshTownEvent;

  const factory ProfileScreenEvent.refreshDistrict(String district) = _RefreshDistrictEvent;

  const factory ProfileScreenEvent.requestAuth() = _RequestAuthEvent;
}
