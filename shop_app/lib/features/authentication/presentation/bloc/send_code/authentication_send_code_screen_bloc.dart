import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/constants/regex/regex.dart';
import 'package:shop_domain/domain/repositories/auth_repository.dart';
import 'package:shop_domain/domain/repositories/local_phone_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';

part 'authentication_send_code_screen_event.dart';
part 'authentication_send_code_screen_state.dart';
part 'authentication_send_code_screen_bloc.freezed.dart';

@injectable
class AuthenticationSendCodeScreenBloc extends Bloc<AuthenticationSendCodeScreenEvent, AuthenticationSendCodeScreenState> {
  final IAuthRepository _iAuthRepository;
  final ILocalPhoneRepository _iLocalPhoneRepository;

  String _phone = '';

  set phone(String num){
    _phone = num;
  }

  AuthenticationSendCodeScreenBloc(this._iAuthRepository, this._iLocalPhoneRepository) : super(const AuthenticationSendCodeScreenState.loading()) {
    on<AuthenticationSendCodeScreenEvent>((event, emit) async {
      await event.map(
          init: (d) async => await _onInit(d,emit),
          sendCode: (d) async => await _onSendCode(d, emit)
      );
    });
    add(const AuthenticationSendCodeScreenEvent.init());
  }

  Future<void> _onInit(_AuthenticationScreenInitEvent d ,Emitter<AuthenticationSendCodeScreenState> emit) async {
    final phone = await _iLocalPhoneRepository.find();
    phone.fold((e){
      // todo emit(AuthenticationSendCodeScreenState.error(e));
    }, (phone){
      _phone = phone ?? '';
      emit(AuthenticationSendCodeScreenState.inputData(phone ?? ''));
    });
  }

  Future<void> _onSendCode(_AuthenticationScreenSendCodeEvent d ,Emitter<AuthenticationSendCodeScreenState> emit) async {

    if(!phoneRegex.hasMatch(_phone)){
      Logger().i('[input phone] $_phone');
      emit(const AuthenticationSendCodeScreenState.wrongPhoneFormat());
      return;
    }


    emit(const AuthenticationSendCodeScreenState.loading());
    final response = await _iAuthRepository.sendCode(_phone);
    response.fold((e){
      emit(AuthenticationSendCodeScreenState.error(e));
    }, (code){
      Logger().i('[code] $code');
      emit(AuthenticationSendCodeScreenState.hasSendCode(_phone, code));
    });
  }
}
