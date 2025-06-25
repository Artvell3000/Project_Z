import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_domain/domain/entity/custom_user/custom_user.dart';
import 'package:shop_domain/domain/repositories/user_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';

part 'profile_screen_event.dart';

part 'profile_screen_state.dart';

part 'profile_screen_bloc.freezed.dart';

@injectable
class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  final IUserRepository _iUserRepository;
  late CustomUser _user;
  bool _hasAuth = false;

  ProfileScreenBloc(this._iUserRepository) : super(const ProfileScreenState.loading()) {
    on<_InitEvent>(_onInit);
    on<_RefreshEvent>(_onRefresh);
    on<_RefreshFullNameEvent>(_onUpdateFullName);
    on<_RefreshTownEvent>(_onUpdateTown);
    on<_RefreshDistrictEvent>(_onUpdateDistinct);
    add(const ProfileScreenEvent.init());
  }

  bool get hasAuth => _hasAuth;

  Future<void> _onInit(_InitEvent event ,Emitter<ProfileScreenState> emit) async {
    await _updateBloc(emit);
  }

  Future<void> _onRefresh(_RefreshEvent event, Emitter<ProfileScreenState> emit) async {
    await _updateBloc(emit);
  }

  Future<void> _onUpdateFullName(_RefreshFullNameEvent event, Emitter<ProfileScreenState> emit) async {
    _handleResult(await _iUserRepository.refreshFullName(event.name), emit);
  }

  Future<void> _onUpdateTown(_RefreshTownEvent event, Emitter<ProfileScreenState> emit) async {
    _handleResult(await _iUserRepository.refreshTown(event.town), emit);
  }

  Future<void> _onUpdateDistinct(_RefreshDistrictEvent event, Emitter<ProfileScreenState> emit) async {
    _handleResult(await _iUserRepository.refreshDistinct(event.district), emit);
  }

  void _handleResult(Either<DomainError, CustomUser> result, Emitter<ProfileScreenState> emit){
    result.fold((error){
      
      error.maybeMap(
        orElse: () => emit(ProfileScreenState.error(error)),
        unauthorized: (d){
          _hasAuth = false;
          emit(const ProfileScreenState.needAuth());
          }
        );
    }, (user){
      if(!_hasAuth || user != _user){
        _hasAuth = true;
        _user = user;
        emit(ProfileScreenState.loaded(user));
      }
    });
  }


  Future<void> _updateBloc(Emitter<ProfileScreenState> emit) async {
    final result = await _iUserRepository.getUser();
    _handleResult(result, emit);
  }
}
