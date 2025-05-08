import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/core/domain/repositories/auth_repository.dart';
import 'package:project_z/core/domain/repositories/token_repository.dart';
import 'package:project_z/core/error/entity/domain_exception.dart';

part 'authentication_verify_code_event.dart';
part 'authentication_verify_code_state.dart';
part 'authentication_verify_code_bloc.freezed.dart';

@injectable
class AuthenticationVerifyCodeBloc extends Bloc<AuthenticationVerifyCodeEvent, AuthenticationVerifyCodeState> {
  AuthenticationVerifyCodeBloc(@factoryParam this._username, this._iAuthRepository, this._iTokenRepository) :
        super(const AuthenticationVerifyCodeState.inputCode(false, 1)) {
    on<AuthenticationVerifyCodeEvent>((event, emit) async {
      await event.map(
          verifyCode: (d) async => await _onVerify(d, emit)
      );
    });
  }

  final IAuthRepository _iAuthRepository;
  final ITokenRepository _iTokenRepository;
  String _inputCode = '';
  int _attempt = 1;

  set code(String c){
    _inputCode = c;
  }

  Future<void> _onVerify(_AuthenticationVerifyCodeScreenVerifyCodeEvent d, Emitter<AuthenticationVerifyCodeState> emit ) async {
    if(!RegExp(r'^\d{6}$').hasMatch(_inputCode)){
      emit(AuthenticationVerifyCodeState.inputCode(true, _attempt++));
      return;
    }

    emit(const AuthenticationVerifyCodeState.loading());
    final tokensResponse = await _iAuthRepository.verifyCode(_username, _inputCode);

    await tokensResponse.fold((e) async {
      handleException(e, emit);
    }, (tokens) async {
      (await _iTokenRepository.save(tokens)).getOrElse((e) => throw(e));
      emit(const AuthenticationVerifyCodeState.successVerifyCode());
    });
  }

  void handleException(DomainError e, Emitter<AuthenticationVerifyCodeState> emit){
    e.maybeMap(
      orElse: (){},
      invalidAuthCode: (d) => emit(AuthenticationVerifyCodeState.inputCode(true, _attempt++))
    );
  }

  final String _username;
}
