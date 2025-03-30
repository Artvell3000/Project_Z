part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.send(String phone) = _SendAuthEvent;
  const factory AuthEvent.verify(String phone, String code) = _VerifyAuthEvent;
}
