part of 'authentication_verify_code_bloc.dart';

@freezed
class AuthenticationVerifyCodeState with _$AuthenticationVerifyCodeState {
  const factory AuthenticationVerifyCodeState.loading() = _VerifyCodeScreenInitState;

  const factory AuthenticationVerifyCodeState.inputCode(bool afterFail, int attempt) = _VerifyCodeScreenInputCodeState;

  const factory AuthenticationVerifyCodeState.successVerifyCode() = _VerifyCodeScreenSuccessCodeState;

  const factory AuthenticationVerifyCodeState.error(DomainError e) = _VerifyCodeScreenErrorState;
}
