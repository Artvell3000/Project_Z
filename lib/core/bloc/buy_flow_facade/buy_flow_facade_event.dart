part of 'buy_flow_facade_bloc.dart';



@freezed
class BuyFlowFacadeEvent with _$BuyFlowFacadeEvent {

  const factory BuyFlowFacadeEvent.init() = _FacadeInitEvent;

  const factory BuyFlowFacadeEvent.requestAuth() = _FacadeRequestAuthEvent;

  const factory BuyFlowFacadeEvent.sendCode(String username) = _FacadeSendCodeEvent;

  const factory BuyFlowFacadeEvent.verifyCode(String username, String code) = _FacadeVerifyCodeEvent;

  const factory BuyFlowFacadeEvent.refreshUser(CustomUser newUser) = _FacadeRefreshUserEvent;
}

