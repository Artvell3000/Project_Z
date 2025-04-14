part of 'auth_screen_bloc.dart';

@freezed
class AuthScreenState with _$AuthScreenState {
  const factory AuthScreenState.hide() = _HideAuthState;

  const factory AuthScreenState.inputData(String? fullUsername, String? username) = _AddDataAuthState;

  const factory AuthScreenState.inputCode(String username) = _WasSendCodeAuthState;

  const factory AuthScreenState.sendingCode() = _SendingCodeAuthState;

  const factory AuthScreenState.verifyingCode() = _VerifyingCodeAuthState;

  const factory AuthScreenState.unsuccessVerifyCode(String username) = _UnsuccessVerifyCodeAuthState;

  const factory AuthScreenState.loaded(CustomUser user) = _LoadedAuthState;

  const factory AuthScreenState.notLoaded() = _NotLoadedAuthState;

  const factory AuthScreenState.loading() = _LoadingAuthState;

  const factory AuthScreenState.error(
    String error,
  ) = _ErrorAuthState;
}
