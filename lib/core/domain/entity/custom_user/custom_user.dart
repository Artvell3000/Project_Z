import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'custom_user.freezed.dart';
part 'custom_user.g.dart';

@freezed
class CustomUser with _$CustomUser {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CustomUser({
    required int id,
    required String username,
    String? fullName,
    String? email,
    String? town,
    String? district,
    String? password,
  }) = _CustomUser;

  factory CustomUser.fromJson(Map<String, dynamic> json) =>
      _$CustomUserFromJson(json);
}

@freezed
class UserList with _$UserList {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserList({
    required int count,
    String? next,
    String? previous,
    required List<CustomUser> results,
  }) = _UserList;

  factory UserList.fromJson(Map<String, dynamic> json) =>
      _$UserListFromJson(json);
}