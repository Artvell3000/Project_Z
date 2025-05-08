import 'package:project_z/core/domain/entity/custom_user/custom_user.dart';
import 'package:project_z/core/network/api/entity/user/custom_user.dart';


extension CustomUserMapper on CustomUserDTO {
  CustomUser toDomain() {
    return CustomUser(
      id: id,
      username: username,
      fullName: fullName,
      town: town,
      district: district,
    );
  }
}