part of 'authentication_verify_code_bloc.dart';

@freezed
class AuthenticationVerifyCodeEvent with _$AuthenticationVerifyCodeEvent {
  const factory AuthenticationVerifyCodeEvent.verifyCode() = _AuthenticationVerifyCodeScreenVerifyCodeEvent;
}
