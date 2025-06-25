part of 'auth_screen_bloc.dart';

@freezed
class AuthScreenEvent with _$AuthScreenEvent {
  const factory AuthScreenEvent.started() = _Started;

  const factory AuthScreenEvent.sendCode() = _SendCodeEvent;

  const factory AuthScreenEvent.verifyCode() = _VerifyCodeEvent;
}