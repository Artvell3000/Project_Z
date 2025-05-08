import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'custom_user.freezed.dart';

@freezed
class CustomUser with _$CustomUser {
  const factory CustomUser({
    required int id,
    required String username,
    String? fullName,
    //String? email,
    String? town,
    String? district,
    //String? password,
  }) = _CustomUser;
}
