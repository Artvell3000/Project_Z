import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:project_z/core/domain/entity/basket/basket.dart';
import 'package:project_z/core/domain/entity/category/category.dart';
import 'package:project_z/core/domain/entity/custom_user/custom_user.dart';
import 'package:project_z/core/domain/repositories/auth_repository.dart';
import 'package:project_z/core/domain/repositories/basket_repository.dart';
import 'package:project_z/core/domain/repositories/token_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/core/network/api/service/api_service.dart';

part 'buy_flow_facade_event.dart';

part 'buy_flow_facade_state.dart';

part 'buy_flow_facade_bloc.freezed.dart';

@singleton
class BuyFlowFacadeBloc extends Bloc<BuyFlowFacadeEvent, BuyFlowFacadeState> {
  final ITokenRepository _tokensRepository;
  final IBasketRepository _basketRepository;
  final IAuthRepository _authRepository;
  final ApiService _api;

  late Map<Category, List<BasketItem>> _basket;

  BuyFlowFacadeBloc(this._tokensRepository, this._basketRepository, this._authRepository, this._api)
      : super(const BuyFlowFacadeState.init()) {
    on<BuyFlowFacadeEvent>((event, emit) async {
      await event.map(
          init: (d) => _onInit(),
          sendCode: (d) => _onSendCode(d, emit),
          verifyCode: (d) => _onVerifyCode(d, emit),
          refreshUser: (d) => _onRefreshUser(d, emit),
          requestAuth: (d) => _onRequestAuth(d, emit),
          requestBasket: (d) => _onRequestBasket(d, emit),
          requestUser: (d) => _onRequestUser(d, emit),
          abortAuth: (d) => _onAbortAuth(d,emit),
        );
    });

    add(const BuyFlowFacadeEvent.init());
  }

  Future<void > _onAbortAuth(_FacadeAbortAuthEvent d, Emitter<BuyFlowFacadeState> emit) async {
    emit(BuyFlowFacadeState.notAuth(DateTime.now()));
  }

  Future<void> _onRequestBasket(_FacadeRequestBasketEvent d, Emitter<BuyFlowFacadeState> emit) async {
    try {
      if (_authRepository.hasAuth) {

        final response =(await basket).getOrElse((e){
          throw(e);
        });

        emit(BuyFlowFacadeState.hasAuth(DateTime.now(), isBasketUpdated: true));
      } else {
        add(const BuyFlowFacadeEvent.requestAuth());
      }
    } on Exception catch (e) {
      emit(BuyFlowFacadeState.error(e));
    }
  }

  Future<void> _onRequestUser(_FacadeRequestUserEvent d, Emitter<BuyFlowFacadeState> emit) async {
    try {
      if (_authRepository.hasAuth) {

        final response =(await user).getOrElse((e){
          throw(e);
        });

        emit(BuyFlowFacadeState.hasAuth(DateTime.now(), isUserUpdated: true));
      } else {
        add(const BuyFlowFacadeEvent.requestAuth());
      }
    } on Exception catch (e) {
      emit(BuyFlowFacadeState.error(e));
    }
  }

  Future<void> _onRequestAuth(_FacadeRequestAuthEvent d, Emitter<BuyFlowFacadeState> emit) async {
    emit(BuyFlowFacadeState.needAuth(DateTime.now()));
  }

  Future<Either<Exception, Map<Category, List<BasketItem>>?>> get basket async {
    try {
      if (_authRepository.hasAuth) {
        final token = _authRepository.tokens.accessToken;
        final items = (await _basketRepository.getMyBasketItems(token: token));

        List<BasketItem> basketItems = [];

        items.fold((e) {
          throw (e);
        }, (page) {
          basketItems = page.results;
        });

        Map<Category, List<BasketItem>> map = {};
        for (final el in basketItems) {
          if (el.product.subcategory != null) {
            final c = await _api.getCategoryById(el.product.subcategory!);
            if (map[c] == null) {
              map[c] = [el];
            } else {
              map[c]!.add(el);
            }
          }
        }
        Logger().i('basket: $map');
        return Either.right(map);
      }
      add(const BuyFlowFacadeEvent.requestAuth());
      return Either.right(null);
    } on Exception catch (e) {
      return Either.left(e);
    }
  }

  Future<Either<Exception, CustomUser?>> get user async {
    try {
      if (_authRepository.hasAuth) {
        return (await _authRepository.getUser());

      }

      add(const BuyFlowFacadeEvent.requestAuth());
      return Either.right(null);
    } on Exception catch (e) {
      return Either.left(e);
    }
  }

  Future<void> _onRefreshUser(_FacadeRefreshUserEvent d, Emitter<BuyFlowFacadeState> emit) async {
    try {
      if (_authRepository.hasAuth) {
        final user = (await _authRepository.refreshUser(d.newUser)).getOrElse((e){
          throw(e);
        });

        emit(BuyFlowFacadeState.hasAuth(DateTime.now(), isUserUpdated: true));
      } else {
        add(const BuyFlowFacadeEvent.requestAuth());
      }
    } on Exception catch (e) {
      emit(BuyFlowFacadeState.error(e));
    }
  }

  Future<void> _onSendCode(_FacadeSendCodeEvent d, Emitter<BuyFlowFacadeState> emit) async {
    try {
      final result = await _authRepository.sendCode(d.username);
      result.fold((e) {
        throw (e);
      }, (code) {
        emit(BuyFlowFacadeState.needInputCode(code));
      });
    } on Exception catch (e) {
      emit(BuyFlowFacadeState.error(e));
    }
  }



  Future<void> _onVerifyCode(_FacadeVerifyCodeEvent d, Emitter<BuyFlowFacadeState> emit) async {
    try {
      (await _authRepository.verifyCode(d.username, d.code)).getOrElse((e) {
        throw (e);
      });

      emit(BuyFlowFacadeState.hasAuth(DateTime.now(), isUserUpdated: true, isBasketUpdated: true));
    } on Exception catch (e) {
      emit(BuyFlowFacadeState.error(e));
    }
  }

  Future<void> _onInit() async {
    //todo в будущем поработать с ошибками
    // try {
    //   final savedTokensResult = await _tokensRepository.find();
    //   if (savedTokensResult.isLeft()) return;
    //
    //   bool hasSavedTokens = true;
    //   final tokens = savedTokensResult.getOrElse((s) {
    //     hasSavedTokens = false;
    //     return null;
    //   });
    //   if (!hasSavedTokens) return;
    //
    //   await _authRepository.setTokens(tokens!);
    // } catch (e) {
    //   return;
    // }
  }
}
