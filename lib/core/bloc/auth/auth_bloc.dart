import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/core/network/api/api_service.dart';
import 'package:project_z/core/network/api/request_models/send_code_request.dart';
import 'package:project_z/core/network/api/request_models/verify_code.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiService api;

  AuthBloc(this.api) : super(const AuthState.loading()) {
    on<AuthEvent>((event, emit) {
      event.when(
          send: (phone) async {
            try{
              final response = await api.sendVerificationCode(const SendCodeRequest(username: '+79222156855'));
              Logger().i('[response]$response');
              if(response.code == null){
                emit(const AuthState.errorSend('code not generated'));
                return;
              }
              emit(AuthState.wasSend(response.code!));
            } catch(e){
              emit(AuthState.errorSend(e.toString()));
            }
          },
          verify: (phone, code) async {
            try{
              final response = await api.verifyCode(VerifyCodeRequest(code: code, username: '+79222156855'));
              Logger().i('[AuthBloc] ${response.message}');
              //emit(const AuthState.verifySuccess());
            } catch(e){
              emit(AuthState.errorSend(e.toString()));
            }
          }
      );

      add(const AuthEvent.send(''));
    });
  }
}
