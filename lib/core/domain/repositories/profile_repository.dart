import 'package:project_z/core/domain/entity/profile/profile.dart';

abstract interface class IProfileRepository{
  Future<Profile> find();
  Future<void> save(Profile profile);
}