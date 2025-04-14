import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:project_z/core/bloc/buy_flow_facade/buy_flow_facade_bloc.dart';
import 'package:project_z/core/domain/entity/custom_user/custom_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_screen_event.dart';

part 'auth_screen_state.dart';

part 'auth_screen_bloc.freezed.dart';

@singleton
class AuthScreenBloc extends Bloc<AuthScreenEvent, AuthScreenState> {

  final BuyFlowFacadeBloc _buyBloc;
  int attemptInputCode = 1;

  late String code;
  late String _inputCode;
  late String _inputUsername;
  late StreamSubscription<BuyFlowFacadeState> subscription;

  AuthScreenBloc(this._buyBloc) : super(const AuthScreenState.loading()) {
    on<AuthScreenEvent>((event, emit) async {
      //Logger().i('[AuthBloc] ${event.toString()}');
      await event.map(
        init: (d) => _onInit(d, emit),
        hide: (d) => _onHide(d, emit),
        startAuth: (d) => _onStartAuth(d, emit),
        sendCode: (d) => _onSendCode(d, emit),
        verifyCode: (d) => _onVerifyCode(d, emit), 
        error: (d) => _onError(d, emit),
      );
    });
    add(const AuthScreenEvent.init());
  }
  
  Future<void> _onError(_ErrorAuthEvent d,Emitter<AuthScreenState> emit) async {
    emit(AuthScreenState.error(d.toString()));
  }

  Future<void> _onHide(_HideAuthEvent d, Emitter<AuthScreenState> emit) async {
    emit(const AuthScreenState.hide());
  }

  Future<void> _onStartAuth(_StartAuthEvent d, Emitter<AuthScreenState> emit) async {
    if(d.code == null) {
      emit(const AuthScreenState.inputData(null, null));
      return;
    }
    code = d.code!;
    emit(AuthScreenState.inputCode(_inputUsername));
  }

  Future<void> _onSendCode(_SendingCodeAuthEvent d, Emitter<AuthScreenState> emit) async {
    emit(const AuthScreenState.sendingCode());
    _inputUsername = d.username;
    _buyBloc.add(BuyFlowFacadeEvent.sendCode(d.username));
  }

  Future<void> _onVerifyCode(_VerifyingCodeAuthEvent d, Emitter<AuthScreenState> emit) async {
    _inputCode = d.code;
    if(_inputCode == code){
      emit(const AuthScreenState.verifyingCode());
      _buyBloc.add(BuyFlowFacadeEvent.verifyCode(_inputUsername, _inputCode));
      return;
    }
    emit(AuthScreenState.unsuccessVerifyCode(DateTime.now()));
  }

  Future<void> _onInit(_InitAuthEvent d, Emitter<AuthScreenState> emit) async {
    subscription = _buyBloc.stream.listen((state){
      Logger().i('_buyBloc.stream.listen(($state)');
      state.mapOrNull(
        needAuth: (d) => add(const AuthScreenEvent.startAuth()),
        needInputCode: (d) => add(AuthScreenEvent.startAuth(code: d.code)),
        newUser: (d) => add(const AuthScreenEvent.hide()),
        error: (d) => add(AuthScreenEvent.error(d.e)),
      );
    },
      onDone: () => Logger().i('Stream closed!'),
      onError: (e) => Logger().e('Stream error: $e'),
    );
  }

}
