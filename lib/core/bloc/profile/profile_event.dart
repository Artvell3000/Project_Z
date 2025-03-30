part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.load(Profile profile) = _LoadProfileEvent;
  const factory ProfileEvent.error(String message) = _LoadProfileEventError;
  const factory ProfileEvent.refresh(Profile profile) = _RefreshProfileEvent;
}