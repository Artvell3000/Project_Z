import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_code_response.freezed.dart';
part 'verify_code_response.g.dart';

@freezed
class VerifyCodeResponse with _$VerifyCodeResponse {
  const factory VerifyCodeResponse({
    required String message,
    required bool userCreated,
    required String username,
    required String accessToken,
    required String refreshToken,
  }) = _VerifyCodeResponse;

  factory VerifyCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeResponseFromJson(json);
}