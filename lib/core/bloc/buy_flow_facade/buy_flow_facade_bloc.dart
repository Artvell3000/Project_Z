import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:project_z/core/domain/entity/custom_user/custom_user.dart';
import 'package:project_z/core/domain/repositories/auth_repository.dart';
import 'package:project_z/core/domain/repositories/basket_repository.dart';
import 'package:project_z/core/domain/repositories/token_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'buy_flow_facade_event.dart';

part 'buy_flow_facade_state.dart';

part 'buy_flow_facade_bloc.freezed.dart';

@singleton
class BuyFlowFacadeBloc extends Bloc<BuyFlowFacadeEvent, BuyFlowFacadeState> {
  final ITokenRepository _tokensRepository;
  final IBasketRepository _basketRepository;
  final IAuthRepository _authRepository;

  BuyFlowFacadeBloc(this._tokensRepository, this._basketRepository, this._authRepository)
      : super(const BuyFlowFacadeState.init()) {
    on<BuyFlowFacadeEvent>((event, emit) async {
      await event.map(
          init: (d) => _onInit(),
          sendCode: (d) => _onSendCode(d, emit),
          verifyCode: (d) => _onVerifyCode(d, emit),
          refreshUser: (d) => _onRefreshUser(d, emit),
          requestAuth: (d) => _onRequestAuth(d, emit)
      );
    });

    add(const BuyFlowFacadeEvent.init());
  }

  Future<void> _onRequestAuth(_FacadeRequestAuthEvent d, Emitter<BuyFlowFacadeState> emit) async {
    Logger().i('[BuyFlowFacadeBloc : _onRequestAuth]');
    emit(const BuyFlowFacadeState.needAuth());
  }

  Future<Either<Exception, CustomUser?>> get user async{
    try{
      if(_authRepository.hasAuth){
        return (await _authRepository.getUser());
      }

      add(const BuyFlowFacadeEvent.requestAuth());
      return Either.right(null);
    } on Exception catch(e){
      return Either.left(e);
    }
  }

  Future<void> _onRefreshUser(_FacadeRefreshUserEvent d, Emitter<BuyFlowFacadeState> emit) async {
    try{
      if(_authRepository.hasAuth){
        await _authRepository.refreshUser(d.newUser);
      } else {
        emit(const BuyFlowFacadeState.needAuth());
      }
    } on Exception catch (e){
      emit(BuyFlowFacadeState.error(e));
    }
  }

  Future<void> _onSendCode(_FacadeSendCodeEvent d, Emitter<BuyFlowFacadeState> emit) async {
    try{
      final result = await _authRepository.sendCode(d.username);
      result.fold((e){
        throw(e);
      }, (code){
        emit(BuyFlowFacadeState.needInputCode(code));
      });
    } on Exception catch (e){
      emit(BuyFlowFacadeState.error(e));
    }
  }

  Future<void> _onVerifyCode(_FacadeVerifyCodeEvent d, Emitter<BuyFlowFacadeState> emit) async {
    try{
      (await _authRepository.verifyCode(d.username, d.code)).getOrElse((e){
        throw(e);
      });

      final user = (await _authRepository.getUser()).getOrElse((e){
        throw(e);
      });

      emit(BuyFlowFacadeState.newUser(user));
    } on Exception catch (e){
      emit(BuyFlowFacadeState.error(e));
    }
  }

  Future<void> _onInit() async {
    //todo в будущем поработать с ошибками
    try{
      final savedTokensResult = await _tokensRepository.find();
      if(savedTokensResult.isLeft()) return;

      bool hasSavedTokens = true;
      final tokens = savedTokensResult.getOrElse((s){
        hasSavedTokens = false;
        return null;
      });
      if(!hasSavedTokens) return;

      await _authRepository.setTokens(tokens!);
    } catch(e){
      return;
    }
  }
}
