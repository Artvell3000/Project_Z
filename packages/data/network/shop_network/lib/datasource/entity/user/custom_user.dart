import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'custom_user.freezed.dart';

part 'custom_user.g.dart';

@freezed
class CustomUserDTO with _$CustomUserDTO {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory CustomUserDTO({
    required int id,
    required String username,
    String? fullName,
    String? email,
    String? town,
    String? district,
    String? password,
  }) = _CustomUserDTO;

  factory CustomUserDTO.fromJson(Map<String, dynamic> json) => _$CustomUserDTOFromJson(json);
}

@freezed
class CustomUserCompanion with _$CustomUserCompanion {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    includeIfNull: false,
  )
  const factory CustomUserCompanion({
    String? username,
    String? fullName,
    String? email,
    String? town,
    String? district,
    String? password,
  }) = _CustomUserCompanion;

  factory CustomUserCompanion.fromJson(Map<String, dynamic> json) =>
      _$CustomUserCompanionFromJson(json);
}
