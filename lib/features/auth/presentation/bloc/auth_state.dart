part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {

  const factory AuthState.hide()  = _HideAuthState;
  const factory AuthState.addData(String? fullUsername, String? username)  = _AddDataAuthState;
  const factory AuthState.wasSendCode(SendCodeResponse response) = _WasSendCodeAuthState;

  const factory AuthState.sendingCode() = _SendingCodeAuthState;
  const factory AuthState.verifyingCode() = _VerifyingCodeAuthState;


  const factory AuthState.successVerifyCode(VerifyCodeResponse response) = _WasVerifyCodeAuthState;
  const factory AuthState.unsuccessVerifyCode() = _UnsuccessVerifyCodeAuthState;


  const factory AuthState.loaded({
    required CustomUser user,
  }) = _LoadedAuthState;

  const factory AuthState.notLoaded() = _NotLoadedAuthState;
  const factory AuthState.loading() = _LoadingAuthState;

  const factory AuthState.error({
    required String error,
  }) = _ErrorAuthState;
}
