import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'verify_code.freezed.dart';
part 'verify_code.g.dart';

// Запрос на проверку кода
@freezed
class VerifyCodeRequest with _$VerifyCodeRequest {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory VerifyCodeRequest({
    required String username, // Номер телефона (+998...)
    required String code,     // Код подтверждения
  }) = _VerifyCodeRequest;

  factory VerifyCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeRequestFromJson(json);
}

// Ответ с JWT токенами
@freezed
class VerifyCodeResponse with _$VerifyCodeResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory VerifyCodeResponse({
    required String access,   // Access token
    required String refresh,  // Refresh token
    String? message,         // Опциональное сообщение
  }) = _VerifyCodeResponse;

  factory VerifyCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeResponseFromJson(json);
}