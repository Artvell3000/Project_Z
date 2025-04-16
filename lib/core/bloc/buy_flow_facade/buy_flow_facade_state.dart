part of 'buy_flow_facade_bloc.dart';

@freezed
class BuyFlowFacadeState with _$BuyFlowFacadeState {
  const factory BuyFlowFacadeState.init() = _FacadeInitState;

  const factory BuyFlowFacadeState.needInputData() = _FacadeNeedInputDataState;

  const factory BuyFlowFacadeState.needInputCode(String code) = _FacadeNeedInputCodeState;

  const factory BuyFlowFacadeState.needAuth(DateTime d) = _FacadeNeedAuthState;

  const factory BuyFlowFacadeState.hasAuth(
      DateTime d, {
        @Default(false) bool isBasketUpdated,
        @Default(false) bool isUserUpdated,
      }) = _FacadeHasAuthState;

  const factory BuyFlowFacadeState.notAuth(DateTime d) = _FacadeNotAuthState;

  const factory BuyFlowFacadeState.error(Exception e) = _FacadeErrorState;
}
