import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/core/bloc/buy_flow_facade/buy_flow_facade_bloc.dart';
import 'package:project_z/core/domain/entity/custom_user/custom_user.dart';

part 'profile_screen_event.dart';

part 'profile_screen_state.dart';

part 'profile_screen_bloc.freezed.dart';

@injectable
class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  final BuyFlowFacadeBloc bloc;
  late CustomUser? _user;

  ProfileScreenBloc(this.bloc) : super(const ProfileScreenState.loading()) {
    on<ProfileScreenEvent>((event, emit) async {
      await event.map(
          init: (d) => _onInit(d, emit),
          loadNewUser: (d) => _onLoadNewUser(d, emit),
          loadNewUserWithError: (d) => _onLoadNewUserWithError(d, emit),
          refreshFullName: (d) => _onRefreshFullName(d, emit),
          refreshUsername: (d) => _onRefreshUsername(d, emit),
          refreshTown: (d) => _onRefreshTown(d, emit),
          refreshDistrict: (d) => _onRefreshDistrict(d, emit),
          requestAuth: (d) => _onRequestAuth(d, emit));
    });
    add(const ProfileScreenEvent.init());
  }

  Future<void> _onLoadNewUser(_LoadNewUserEvent d, Emitter<ProfileScreenState> emit) async {
    emit(ProfileScreenState.loaded(d.user));
  }

  Future<void> _onRequestAuth(_RequestAuthEvent d, Emitter<ProfileScreenState> emit) async {
    bloc.add(const BuyFlowFacadeEvent.requestAuth());
  }

  Future<void> _onLoadNewUserWithError(_LoadNewUserWithErrorEvent d, Emitter<ProfileScreenState> emit) async {
    emit(ProfileScreenState.error(d.message));
  }

  Future<void> _onRefreshFullName(_RefreshFullNameEvent d, Emitter<ProfileScreenState> emit) async {
    emit(const ProfileScreenState.loading());
    bloc.add(BuyFlowFacadeEvent.refreshUser(CustomUserCompanion(fullName: d.name)));
  }

  Future<void> _onRefreshUsername(_RefreshUsernameEvent d, Emitter<ProfileScreenState> emit) async {
    emit(const ProfileScreenState.loading());
    bloc.add(BuyFlowFacadeEvent.refreshUser(CustomUserCompanion(username: d.username)));
  }

  Future<void> _onRefreshTown(_RefreshTownEvent d, Emitter<ProfileScreenState> emit) async {
    emit(const ProfileScreenState.loading());
    bloc.add(BuyFlowFacadeEvent.refreshUser(CustomUserCompanion(town: d.town)));
  }

  Future<void> _onRefreshDistrict(_RefreshDistrictEvent d, Emitter<ProfileScreenState> emit) async {
    emit(const ProfileScreenState.loading());
    bloc.add(BuyFlowFacadeEvent.refreshUser(CustomUserCompanion(district: d.district)));
  }

  Future<void> _loadUser() async {
    (await bloc.user).fold((e) {
      add(ProfileScreenEvent.loadNewUserWithError(e.toString()));
    }, (user) {
      if (user == null) {
        add(const ProfileScreenEvent.loadNewUser(null));
      } else {
        add(ProfileScreenEvent.loadNewUser(user));
      }
    });
  }

  Future<void> _onInit(_InitEvent d, Emitter<ProfileScreenState> emit) async {
    await bloc.state.mapOrNull(notAuth: (d) async {
      bloc.add(const BuyFlowFacadeEvent.requestAuth());
      add(const ProfileScreenEvent.loadNewUser(null));
    }, hasAuth: (d) async {
      if (d.isUserUpdated) {
        await _loadUser();
      }
    });

    bloc.stream.listen((state) {
      state.mapOrNull(

      //     notAuth: (d) async {
      //   bloc.add(const BuyFlowFacadeEvent.requestAuth());
      //   add(const ProfileScreenEvent.loadNewUser(null));
      // },

          hasAuth: (d) async {
        if (d.isUserUpdated) {
          await _loadUser();
        }
      });
    });
  }
}
