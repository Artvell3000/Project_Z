import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_code_request.freezed.dart';
part 'send_code_request.g.dart';

@freezed
class SendCodeRequest with _$SendCodeRequest {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SendCodeRequest({
    required String username,
  }) = _SendCodeRequest;

  factory SendCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$SendCodeRequestFromJson(json);
}

@freezed
class SendCodeResponse with _$SendCodeResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SendCodeResponse({
    String? code,
    String? message,
  }) = _SendCodeResponse;

  factory SendCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$SendCodeResponseFromJson(json);
}