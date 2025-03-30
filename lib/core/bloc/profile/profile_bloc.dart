import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/core/domain/entity/profile/profile.dart';
import 'package:project_z/core/domain/repositories/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IProfileRepository repo;

  ProfileBloc(this.repo) : super(const ProfileState.loading()) {
    on<ProfileEvent>((event, emit) {
      event.when(
          load: (p){
            emit(ProfileState.loaded(p));
          },
          refresh: (p) async {
            emit(const ProfileState.loading());
            await repo.save(p);
            emit(ProfileState.loaded(p));
          },
          error: (message){
            emit(ProfileState.error(message));
      }
      );
    });
    initData();
  }

  Future<void> initData() async{
    try{
      final profile = await repo.find();
      add(ProfileEvent.load(profile));
    } catch(e){
      add(ProfileEvent.error(e.toString()));
    }
    
  }
}
