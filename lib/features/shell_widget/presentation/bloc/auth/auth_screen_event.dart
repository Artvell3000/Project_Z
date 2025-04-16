part of 'auth_screen_bloc.dart';

@freezed
class AuthScreenEvent with _$AuthScreenEvent {
  const factory AuthScreenEvent.init() = _InitAuthEvent;

  const factory AuthScreenEvent.error(Exception e) = _ErrorAuthEvent;

  const factory AuthScreenEvent.hide(bool hasAuth) = _HideAuthEvent;

  const factory AuthScreenEvent.sendCode(String username) = _SendingCodeAuthEvent;

  const factory AuthScreenEvent.verifyCode(String username, String code) = _VerifyingCodeAuthEvent;

  const factory AuthScreenEvent.startAuth({String? code}) = _StartAuthEvent;
}
