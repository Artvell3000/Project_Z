import 'package:freezed_annotation/freezed_annotation.dart';

part 'tokens.freezed.dart';
part 'tokens.g.dart';

@freezed
class AuthTokens with _$AuthTokens {
  const AuthTokens._();

  const factory AuthTokens({
    String? accessToken,
    String? refreshToken,
  }) = _AuthTokens;

  factory AuthTokens.fromJson(Map<String, dynamic> json) => _$AuthTokensFromJson(json);

  bool get isValid => accessToken != null && refreshToken != null;
}