import 'package:injectable/injectable.dart';
import 'package:project_z/core/domain/repositories/profile_repository.dart';
import 'package:project_z/data/data_entity/custom_user_json.dart';
import 'package:project_z/data/datasource/profile_loader/profile_loader.dart';

@Singleton(as: IUserRepository)
class UserRepository implements IUserRepository{

  CustomUserJson? _user;

  @override
  Future<CustomUserJson> find() async {
    return await ProfileJsonLoader.loadProfile();
  }

  @override
  Future<void> save(CustomUserJson profile) async {
    return await ProfileJsonLoader.updateProfile(profile);
  }

  @override

  CustomUserJson get user{
    if(_user != null) return _user!;
    _user = const CustomUserJson();
    return _user!;
  }

}