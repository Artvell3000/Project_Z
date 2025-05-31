import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_domain/domain/entity/custom_user/custom_user.dart';
import 'package:shop_domain/domain/entity/tokens/tokens.dart';
import 'package:shop_domain/domain/repositories/token_repository.dart';
import 'package:shop_domain/domain/repositories/user_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';

part 'profile_screen_event.dart';

part 'profile_screen_state.dart';

part 'profile_screen_bloc.freezed.dart';

@injectable
class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  final IUserRepository _iUserRepository;
  final ITokenRepository _iTokenRepository;

  AuthTokens? _tokens;
  CustomUser? _user;

  ProfileScreenBloc(this._iUserRepository, this._iTokenRepository) : super(const ProfileScreenState.loading()) {
    on<ProfileScreenEvent>((event, emit) async {
      await event.map(
          init: (d) => _onInit(d, emit),
          refreshFullName: (d) => _onRefreshFullName(d, emit),
          refreshUsername: (d) => _onRefreshUsername(d, emit),
          refreshTown: (d) => _onRefreshTown(d, emit),
          refreshDistrict: (d) => _onRefreshDistrict(d, emit),
          refresh: (d) => _onRefresh(d, emit)
    );
    });
    add(const ProfileScreenEvent.init());
  }

  void _handlingUserResponse(Emitter<ProfileScreenState> emit, Either<DomainError, CustomUser> userResponse){
    userResponse.fold((e){
      _onHandleError(e, emit);
    }, (user){
      Logger().i(user.toString());
      _user = user;
      emit(ProfileScreenState.loaded(user));
    });
  }

  void _onHandleError(DomainError e, Emitter<ProfileScreenState> emit) {
    e.maybeMap(
        orElse: () => emit(ProfileScreenState.error(e)),
        unauthorized: (d) => emit(const ProfileScreenState.needAuth())
    );
  }

  Future<void> _onRefreshFullName(_RefreshFullNameEvent d, Emitter<ProfileScreenState> emit) async {
    if(_tokens == null){
      emit(const ProfileScreenState.needAuth());
      return;
    }

    final userResponse =  await _iUserRepository.refreshFullName(_tokens!.accessToken, d.name);
    _handlingUserResponse(emit, userResponse);
  }

  Future<void> _onRefreshUsername(_RefreshUsernameEvent d, Emitter<ProfileScreenState> emit) async {
    if(_tokens == null){
      emit(const ProfileScreenState.needAuth());
      return;
    }

    final userResponse =  await _iUserRepository.refreshUsername(_tokens!.accessToken, d.username);
    _handlingUserResponse(emit, userResponse);
  }

  Future<void> _onRefreshTown(_RefreshTownEvent d, Emitter<ProfileScreenState> emit) async {
    if(_tokens == null){
      emit(const ProfileScreenState.needAuth());
      return;
    }
    final userResponse =  await _iUserRepository.refreshTown(_tokens!.accessToken, d.town);
    _handlingUserResponse(emit, userResponse);
  }

  Future<void> _onRefreshDistrict(_RefreshDistrictEvent d, Emitter<ProfileScreenState> emit) async {
    if(_tokens == null){
      emit(const ProfileScreenState.needAuth());
      return;
    }
    final userResponse =  await _iUserRepository.refreshDistinct(_tokens!.accessToken, d.district);
    _handlingUserResponse(emit, userResponse);
  }

  Future<void> updateBloc(Emitter<ProfileScreenState> emit) async {
    final tokens = (await _iTokenRepository.find()).getOrElse((e) => throw(e));
    if(tokens == null){
      emit(const ProfileScreenState.needAuth());
      return;
    }

    final response = await _iUserRepository.getUser(tokens.accessToken);
    response.fold(
        (e){
          _onHandleError(e, emit);
        }, (user){
          _user = user;
          _tokens = tokens;
          emit(ProfileScreenState.loaded(user));
        }
    );
  }

  Future<void> _onRefresh(_RefreshEvent d, Emitter<ProfileScreenState> emit) async {
    await updateBloc(emit);
  }

  Future<void> _onInit(_InitEvent d, Emitter<ProfileScreenState> emit) async {
    await updateBloc(emit);
  }

}
