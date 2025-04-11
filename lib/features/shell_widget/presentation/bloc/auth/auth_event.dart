part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.init() = _InitAuthEvent;

  const factory AuthEvent.refresh(CustomUser newUser) = _RefreshAuthEvent;

  const factory AuthEvent.hide() = _HideAuthEvent;

  const factory AuthEvent.sendCode(String username) = _SendingCodeAuthEvent;

  const factory AuthEvent.verifyCode(String username, String code) = _VerifyingCodeAuthEvent;

  const factory AuthEvent.startAuth() = _StartAuthEvent;
}
