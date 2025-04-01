import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/core/domain/repositories/profile_repository.dart';
import 'package:project_z/data/data_entity/custom_user_json.dart';

part 'profile_screen_event.dart';

part 'profile_screen_state.dart';

part 'profile_screen_bloc.freezed.dart';

@injectable
class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  final IUserRepository repository;
  late CustomUserJson userJson;

  ProfileScreenBloc(this.repository) : super(const ProfileScreenState.loading()) {
    on<ProfileScreenEvent>((event, emit) {
      event.when(loaded: (profile) {
        emit(ProfileScreenState.loaded(profile));
      },refresh: (profile) {

      }, error: (message) {
        emit(ProfileScreenState.error(message));
      });
    });
    initData();
  }

  Future<void>  initData() async {
    try{
      userJson = await repository.find();
      add(ProfileScreenEvent.loaded(userJson));
    } catch(e){
      add(ProfileScreenEvent.error(e.toString()));
    }
  }
}
