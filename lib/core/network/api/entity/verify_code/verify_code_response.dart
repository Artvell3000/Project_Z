import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_code_response.freezed.dart';
part 'verify_code_response.g.dart';

@freezed
class VerifyCodeResponse with _$VerifyCodeResponse {
  const factory VerifyCodeResponse({
    required String message,
    @JsonKey(name: 'user_created') required bool userCreated,
    required String username,
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
  }) = _VerifyCodeResponse;

  factory VerifyCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeResponseFromJson(json);
}