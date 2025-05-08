part of 'authentication_send_code_screen_bloc.dart';

@freezed
class AuthenticationSendCodeScreenState with _$AuthenticationSendCodeScreenState {
  const factory AuthenticationSendCodeScreenState.loading() = _AuthenticationScreenInitState;

  const factory AuthenticationSendCodeScreenState.inputData(String phone) = _AuthenticationScreenInputDataState;

  const factory AuthenticationSendCodeScreenState.hasSendCode(String phone, String code) = _AuthenticationScreenHasSendCodeState;

  const factory AuthenticationSendCodeScreenState.error(DomainError e) = _AuthenticationScreenErrorState;

  const factory AuthenticationSendCodeScreenState.wrongPhoneFormat() = _AuthenticationScreenPhoneFormatState;
}
