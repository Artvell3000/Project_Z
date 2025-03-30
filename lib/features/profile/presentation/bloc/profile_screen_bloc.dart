import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/core/bloc/profile/profile_bloc.dart';
import 'package:project_z/core/domain/entity/entity.dart';

part 'profile_screen_event.dart';

part 'profile_screen_state.dart';

part 'profile_screen_bloc.freezed.dart';

@injectable
class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  final ProfileBloc bloc;
  Profile? profile;

  ProfileScreenBloc(this.bloc) : super(const ProfileScreenState.loading()) {
    on<ProfileScreenEvent>((event, emit) {
      event.when(loaded: (profile) {
        emit(ProfileScreenState.loaded(profile));
      }, refresh: (
        profile
      ) {
        bloc.add(ProfileEvent.refresh(profile));
      }, error: (message) {
        emit(ProfileScreenState.error(message));
      });
    });
    initListeners();
  }

  Future<void>  initListeners() async {
    bloc.stream.listen((state) {
      state.mapOrNull(loaded: (data) {
        profile = data.profile;
        add(ProfileScreenEvent.loaded(profile!));
      }, error: (data) {
        add(ProfileScreenEvent.error(
          data.message,
        ));
      });
    });
  }
}
