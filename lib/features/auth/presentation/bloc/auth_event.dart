part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {

  const factory AuthEvent.hide()  = _HideAuthEvent;
  const factory AuthEvent.sendCode(String username) = _SendingCodeAuthEvent;
  const factory AuthEvent.verifyCode(String username, String code) = _VerifyingCodeAuthEvent;
  const factory AuthEvent.startAuth() = _StartAuthEvent;
  const factory AuthEvent.endAuth() = _EndAuthEvent;

  const factory AuthEvent.load() = _LoadedAuthEvent;

  const factory AuthEvent.error(
    String error,
  ) = _ErrorAuthEvent;
}