import 'package:project_z/data/data_entity/custom_user_json.dart';

abstract interface class IUserRepository{
  CustomUserJson get user;
  Future<CustomUserJson> find();
  Future<void> save(CustomUserJson profile);
}