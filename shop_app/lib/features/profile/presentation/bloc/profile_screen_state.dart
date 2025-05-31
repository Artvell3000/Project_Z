part of 'profile_screen_bloc.dart';

@freezed
class ProfileScreenState with _$ProfileScreenState {
  const factory ProfileScreenState.loading() = _LoadingProfileScreenState;

  const factory ProfileScreenState.loaded(CustomUser user) = _LoadedUserState;

  const factory ProfileScreenState.needAuth() = _NeedAuthState;

  const factory ProfileScreenState.error(DomainError e) = _ErrorUserScreenState;
}
