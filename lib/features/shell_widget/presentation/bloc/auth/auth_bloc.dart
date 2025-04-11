import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/core/domain/entity/custom_user/custom_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/core/domain/entity/tokens/tokens.dart';
import 'package:project_z/core/network/api/request_models/request_models.dart';
import 'package:project_z/core/network/api/service/api_service.dart';
import 'package:project_z/core/domain/repositories/token_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

@Singleton()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiService _api;
  final ITokenRepository _tokensRepository;

  bool get isLoaded => !(_tokens == null || _user == null);

  AuthTokens? _tokens;
  CustomUser? _user;
  String? _inputCode;
  String? _inputUsername;

  AuthBloc(this._api, this._tokensRepository) : super(const AuthState.loading()) {
    on<AuthEvent>((event, emit) async {
      Logger().i('[AuthBloc] ${event.toString()}');
      await event.map(
        init: (d) => _onInit(d, emit),
        refresh: (d) => _onRefreshUser(d, emit),
        hide: (d) => _onHide(d, emit),
        startAuth: (d) => _onStartAuth(d, emit),
        sendCode: (d) => _onSendCode(d, emit),
        verifyCode: (d) => _onVerifyCode(d, emit),
      );
    });
    add(const AuthEvent.init());
  }

  Future<void> _onRefreshUser(_RefreshAuthEvent d, Emitter<AuthState> emit) async {
    try {
      emit(const AuthState.loading());
      _user = await _api.updateCurrentUser('Bearer ${_tokens!.accessToken!}', d.newUser);
      emit(AuthState.loaded(_user!));
    } catch (e) {
      Logger().e('[onRefreshUser] ${e.toString()}');
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onHide(_HideAuthEvent d, Emitter<AuthState> emit) async {
    if (_user == null || _tokens == null) {
      emit(const AuthState.notLoaded());
      return;
    }
    emit(AuthState.loaded(_user!));
  }

  Future<void> _onStartAuth(_StartAuthEvent d, Emitter<AuthState> emit) async {
    if (_user != null) {
      if ((_user?.fullName == null || _user?.username == null)) {
        emit(AuthState.inputData(_user?.fullName, _user?.username));
        return;
      }
      emit(AuthState.inputCode(_user!.username));
      return;
    }

    emit(const AuthState.inputData(null, null));
  }

  Future<void> _onSendCode(_SendingCodeAuthEvent d, Emitter<AuthState> emit) async {
    emit(const AuthState.sendingCode());
    try {
      _inputUsername = d.username;
      final response = await _api.sendVerificationCode(SendCodeRequest(username: _inputUsername!));

      Logger().i('[AuthBloc : _onSendCode : response] $response');

      _inputCode = response.code;
      emit(AuthState.inputCode(_inputUsername!));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onVerifyCode(_VerifyingCodeAuthEvent d, Emitter<AuthState> emit) async {
    emit(const AuthState.verifyingCode());
    if (d.code != _inputCode) {
      emit(AuthState.unsuccessVerifyCode(_inputUsername!));
      return;
    }
    try {
      final response = await _api.verifyCode(VerifyCodeRequest(username: _inputUsername!, code: d.code));
      _tokens = AuthTokens(accessToken: response.accessToken, refreshToken: response.refreshToken);

      //todo для тестов
      final e = await _tokensRepository.save(_tokens!);
      if (e != null) Logger().e('[_tokensRepository.save(_tokens!)] $e');
      final savedTokens = await _tokensRepository.find();
      Logger().i('[savedTokens] $savedTokens');

      _user = (await _api.getCurrentUser('Bearer ${response.accessToken}'));

      Logger().d('[_onVerifyCode : response] $response');
      Logger().d('[_onVerifyCode : user] $_user');

      if (_user != null) {
        emit(AuthState.loaded(_user!));
      } else {
        emit(const AuthState.notLoaded());
      }
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onInit(_InitAuthEvent d, Emitter<AuthState> emit) async {
    try {
      final findTokensResult = await _tokensRepository.find();
      String? message;

      AuthTokens? tokens = findTokensResult.getOrElse((e) {
        message = e.toString();
        return null;
      });

      if (message != null || tokens == null) {
        emit(const AuthState.notLoaded());
        Logger().i('[AuthState] $state');
        return;
      }

      _tokens = tokens;
      if (_tokens?.accessToken != null) {
        _user = await _api.getCurrentUser(_tokens!.accessToken!);
        emit(AuthState.loaded(_user!));
        Logger().i('[AuthState] $state');
        return;
      }
      emit(const AuthState.notLoaded());
      Logger().i('[AuthState] $state');
    } catch (e) {
      emit(const AuthState.notLoaded());
      Logger().i('[AuthState] $state');
    }
  }
}
