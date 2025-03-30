part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.loading() = _LoadingState;
  const factory ProfileState.loaded(Profile profile) = _LoadedState;
  const factory ProfileState.error(String message) = _ErrorState;
}