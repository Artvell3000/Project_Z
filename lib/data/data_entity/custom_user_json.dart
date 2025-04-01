import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_user_json.freezed.dart';
part 'custom_user_json.g.dart';

@freezed
class CustomUserJson with _$CustomUserJson {
  const factory CustomUserJson({
    int? id,
    String? username,
    String? fullName,
    String? email,
    String? town,
    String? district,
    String? password,
  }) = _CustomUserJson;

  factory CustomUserJson.fromJson(Map<String, dynamic> json) => _$CustomUserJsonFromJson(json);
}