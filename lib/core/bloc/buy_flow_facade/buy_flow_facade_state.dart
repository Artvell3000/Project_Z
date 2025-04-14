part of 'buy_flow_facade_bloc.dart';

@freezed
class BuyFlowFacadeState with _$BuyFlowFacadeState {

  const factory BuyFlowFacadeState.init() = _FacadeInitState;

  const factory BuyFlowFacadeState.needInputCode(String code) = _FacadeNeedInputCodeState;

  const factory BuyFlowFacadeState.needAuth(DateTime d) = _FacadeNeedAuthState;

  const factory BuyFlowFacadeState.newUser(CustomUser user) = _FacadeNewUserState;

  const factory BuyFlowFacadeState.error(Exception e) = _FacadeErrorState;
}
