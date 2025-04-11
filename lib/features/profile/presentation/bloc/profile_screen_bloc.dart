import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/core/domain/entity/custom_user/custom_user.dart';
import 'package:project_z/features/shell_widget/presentation/bloc/auth/auth_bloc.dart';

part 'profile_screen_event.dart';

part 'profile_screen_state.dart';

part 'profile_screen_bloc.freezed.dart';

@injectable
class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  final AuthBloc bloc;
  late CustomUser _user;

  ProfileScreenBloc(this.bloc) : super(const ProfileScreenState.loading()) {
    on<ProfileScreenEvent>((event, emit) async {
      Logger().i('[ProfileScreenBloc : event] $event');
      await event.map(
        init: (d) => _onInit(d, emit),
        loadNewUser: (d) => _onLoadNewUser(d, emit),
        loadNewUserWithError: (d) => _onLoadNewUserWithError(d, emit),
        refreshFullName: (d) => _onRefreshFullName(d, emit),
        refreshUsername: (d) => _onRefreshUsername(d, emit),
        refreshTown: (d) => _onRefreshTown(d, emit),
        refreshDistrict: (d) => _onRefreshDistrict(d, emit),
      );
    });
    add(const ProfileScreenEvent.init());
  }

  Future<void> _onLoadNewUser(_LoadNewUserEvent d, Emitter<ProfileScreenState> emit) async {
    emit(ProfileScreenState.loaded(d.user));
  }

  Future<void> _onLoadNewUserWithError(_LoadNewUserWithErrorEvent d, Emitter<ProfileScreenState> emit) async {
    emit(ProfileScreenState.error(d.message));
  }

  Future<void> _onRefreshFullName(_RefreshFullNameEvent d, Emitter<ProfileScreenState> emit) async {
    emit(const ProfileScreenState.loading());
    bloc.add(AuthEvent.refresh(_user.copyWith(fullName: d.name)));
  }

  Future<void> _onRefreshUsername(_RefreshUsernameEvent d, Emitter<ProfileScreenState> emit) async {
    emit(const ProfileScreenState.loading());
    bloc.add(AuthEvent.refresh(_user.copyWith(username: d.username)));
  }

  Future<void> _onRefreshTown(_RefreshTownEvent d, Emitter<ProfileScreenState> emit) async {
    emit(const ProfileScreenState.loading());
    bloc.add(AuthEvent.refresh(_user.copyWith(town: d.town)));
  }

  Future<void> _onRefreshDistrict(_RefreshDistrictEvent d, Emitter<ProfileScreenState> emit) async {
    emit(const ProfileScreenState.loading());
    bloc.add(AuthEvent.refresh(_user.copyWith(district: d.district)));
  }

  Future<void> _onInit(_InitEvent d, Emitter<ProfileScreenState> emit) async {
    bloc.state.mapOrNull(loaded: (d) {
      _user = d.user;
      emit(ProfileScreenState.loaded(d.user));
    }, notLoaded: (d) {
      emit(const ProfileScreenState.loaded(null));
    }, error: (d) {
      emit(ProfileScreenState.error(d.error));
    });

    bloc.stream.listen((state) {
      Logger().i('[ProfileScreenBloc : state] $state');
      state.mapOrNull(loaded: (d) {
        _user = d.user;
        add(ProfileScreenEvent.loadNewUser(d.user));

      }, notLoaded: (d) {
        add(const ProfileScreenEvent.loadNewUser(null));
      }, error: (d) {
        add(ProfileScreenEvent.loadNewUserWithError(d.error));
      });
    });
  }
}
