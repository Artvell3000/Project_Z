import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_z/core/domain/entity/custom_user/custom_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/core/network/api/request_models/request_models.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.loading()) {
    on<AuthEvent>((event, emit) {
      event.mapOrNull(
        hide: (d){
          emit(const AuthState.hide());
        },
        startAuth: (d){
          emit(const AuthState.addData(null,null));
        },
        verifyCode: (d){
          emit(const AuthState.wasSendCode(SendCodeResponse(message: '', code: '')));
        }
      );
    });
  }

  String? get fullName{
    return _fullName;
  }
  String? get phone{
    return _phone;
  }

  String? _fullName;
  String? _phone;
}
