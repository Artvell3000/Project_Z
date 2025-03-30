part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = _LoadingAuthState;
  const factory AuthState.verifySuccess() = _VerifySuccessAuthState;
  const factory AuthState.verifyUnsuccess() = _VerifyUnsuccessAuthState;
  const factory AuthState.errorSend(String message) = _ErrorSendAuthState;
  const factory AuthState.wasSend(String code) = _WasSendAuthState;
}
