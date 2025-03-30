import 'package:injectable/injectable.dart';
import 'package:project_z/core/domain/entity/profile/profile.dart';
import 'package:project_z/core/domain/repositories/profile_repository.dart';
import 'package:project_z/data/datasource/profile_loader/profile_loader.dart';

@Singleton(as: IProfileRepository)
class ProfileRepository implements IProfileRepository{
  @override
  Future<Profile> find() async {
    return await ProfileJsonLoader.loadProfile();
  }

  @override
  Future<void> save(Profile profile) async {
    return await ProfileJsonLoader.updateProfile(profile);
  }

}