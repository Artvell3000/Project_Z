import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_user.freezed.dart';
part 'custom_user.g.dart';

@freezed
class CustomUser with _$CustomUser {
  const factory CustomUser({
    required int id,
    required String username,
    String? fullName,
    String? email,
    String? town,
    String? district,
    String? password,
  }) = _CustomUser;

  factory CustomUser.fromJson(Map<String, dynamic> json) => _$CustomUserFromJson(json);
}