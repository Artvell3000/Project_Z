part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.hide() = _HideAuthState;

  const factory AuthState.inputData(String? fullUsername, String? username) = _AddDataAuthState;

  const factory AuthState.inputCode(String username) = _WasSendCodeAuthState;

  const factory AuthState.sendingCode() = _SendingCodeAuthState;

  const factory AuthState.verifyingCode() = _VerifyingCodeAuthState;

  const factory AuthState.unsuccessVerifyCode(String username) = _UnsuccessVerifyCodeAuthState;

  const factory AuthState.loaded(CustomUser user) = _LoadedAuthState;

  const factory AuthState.notLoaded() = _NotLoadedAuthState;

  const factory AuthState.loading() = _LoadingAuthState;

  const factory AuthState.error(
    String error,
  ) = _ErrorAuthState;
}
