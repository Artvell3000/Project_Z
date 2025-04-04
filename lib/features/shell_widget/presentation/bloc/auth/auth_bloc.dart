import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:project_z/core/domain/entity/custom_user/custom_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/core/network/api/request_models/request_models.dart';
import 'package:project_z/core/network/api/service/api_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiService api = ApiService(Dio());

  String? _token;
  String? _refreshToken;
  String? _username;
  CustomUser? _user;
  CustomUser? get user{
    return _user;
  }

  AuthBloc() : super(const AuthState.loading()) {
    on<AuthEvent>((event, emit) async {
      await event.mapOrNull(
        hide: (d) {
          emit(const AuthState.hide());
        },
        startAuth: (d){
          emit(const AuthState.inputData(null,null));
        },
        sendCode: (d) async {
          emit(const AuthState.sendingCode());
          try {
            final SendCodeResponse response;
            response = await api.sendVerificationCode(SendCodeRequest(username:  d.username));
            Logger().d('[response] $response');
            emit(AuthState.inputCode(d.username, response.code));
          }catch(e){
            emit(AuthState.error(error: e.toString()));
          }
        },
        verifyCode: (d) async {
          emit(const AuthState.verifyingCode());
          try{
            final VerifyCodeResponse response;
            response = await api.verifyCode(VerifyCodeRequest(username: d.username, code: d.code));
            _token = response.accessToken;
            _refreshToken = response.accessToken;
            final user = (await api.getCurrentUser('Bearer ${response.accessToken}'));

            Logger().d('[response] $response');
            Logger().d('[user] $user');

            emit(const AuthState.hide());
          } catch(e){
            emit(AuthState.error(error: e.toString()));
          }


          //emit(const AuthState.verifyingCode());

          //emit(AuthState.loaded(CustomUser()));
          //emit(AuthState.notLoaded())
        },
      );
    });
  }


  void _hideAuth(){

  }
}
