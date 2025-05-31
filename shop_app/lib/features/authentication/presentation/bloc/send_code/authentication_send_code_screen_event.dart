part of 'authentication_send_code_screen_bloc.dart';

@freezed
class AuthenticationSendCodeScreenEvent with _$AuthenticationSendCodeScreenEvent {
  const factory AuthenticationSendCodeScreenEvent.init() = _AuthenticationScreenInitEvent;

  const factory AuthenticationSendCodeScreenEvent.sendCode() = _AuthenticationScreenSendCodeEvent;
}
