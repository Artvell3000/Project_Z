import 'package:freezed_annotation/freezed_annotation.dart';

part 'domain_exception.freezed.dart';

@freezed
sealed class DomainError with _$DomainError {
  const factory DomainError.networkError({
    required String message,
    @Default('Network error') String title,
    int? code,
  }) = NetworkError;

  const factory DomainError.unauthorized({
    required String message,
    @Default('Unauthorized') String title,
    int? code,
  }) = UnauthorizedError;

  const factory DomainError.notFound({
    required String message,
    @Default('Not found') String title,
    int? code,
  }) = NotFoundError;

  const factory DomainError.serverError({
    required String message,
    @Default('Server error') String title,
    int? code,
  }) = ServerError;

  const factory DomainError.badRequest({
    required String message,
    @Default('Bad request') String title,
    int? code,
  }) = BadRequestError;

  const factory DomainError.timeout({
    required String message,
    @Default('Timeout') String title,
    int? code,
  }) = TimeoutError;

  const factory DomainError.connectionError({
    required String message,
    @Default('Connection error') String title,
    int? code,
  }) = ConnectionError;

  const factory DomainError.invalidAuthCode({
    required String message,
    @Default('Invalid auth code') String title,
    int? code,
  }) = InvalidAuthCodeError;

  const factory DomainError.hiveError({
    required String message,
    @Default('Hive error') String title,
    int? code,
  }) = HiveError;

  const factory DomainError.unknown({
    required String message,
    @Default('Unknown error') String title,
    int? code,
  }) = UnknownError;
}