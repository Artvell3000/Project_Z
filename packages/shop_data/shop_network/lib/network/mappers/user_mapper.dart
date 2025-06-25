import 'package:shop_domain/domain/entity/custom_user/custom_user.dart';
import 'package:shop_network/network/entity/user/custom_user.dart';

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