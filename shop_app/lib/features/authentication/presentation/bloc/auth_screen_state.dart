part of 'auth_screen_bloc.dart';

@freezed
class AuthScreenState with _$AuthScreenState {
  const factory AuthScreenState.initial() = _Initial;

  const factory AuthScreenState.sendingCode() = _SendingCodeState;

  const factory AuthScreenState.successSendCode() = _SuccessSendCodeState;

  const factory AuthScreenState.unsuccessSendCode() = _UnsuccessSendCodeState;

  const factory AuthScreenState.verifyingCode() = _VerifyCodeState;

  const factory AuthScreenState.successVerifyCode() = _SuccessVerifyCodeState;

  const factory AuthScreenState.unsuccessVerifyCode() = _UnsuccessVerifyCodeState;
}
