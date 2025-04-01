part of 'profile_screen_bloc.dart';

@freezed
class ProfileScreenState with _$ProfileScreenState {
  const factory ProfileScreenState.loading() = _LoadingProfileScreenState;
  const factory ProfileScreenState.loaded(CustomUserJson profile) = _LoadedProfileScreenState;
  const factory ProfileScreenState.error(String message) = _ErrorProfileScreenState;
}
