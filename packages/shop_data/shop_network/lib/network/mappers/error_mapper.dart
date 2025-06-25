import 'package:dio/dio.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';

class DomainErrorMapper {

  static DomainError map(Exception e){
    if(e is DioException){
      return mapDio(e);
    }

    return DomainError.unknown(message: e.toString());
  }

  static DomainError mapDio(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const DomainError.timeout(
          message: 'Request timed out',
        ).copyWith(code: error.response?.statusCode);
      case DioExceptionType.badResponse:
        return _handleResponseError(error);
      case DioExceptionType.cancel:
        return const DomainError.networkError(
          message: 'Request was cancelled',
        );
      case DioExceptionType.connectionError:
        return const DomainError.connectionError(
          message: 'No internet connection',
        );
      case DioExceptionType.unknown:
        return const DomainError.unknown(
          message: 'Unknown network error',
        );
      case DioExceptionType.badCertificate:
        return const DomainError.networkError(
          message: 'Bad certificate',
        );
    }
  }

  static DomainError _handleResponseError(DioException error) {
    try {
      // Обработка специфической ошибки неверного кода
      if (error.response?.statusCode == 400 &&
          error.response?.data is Map &&
          (error.response!.data as Map)['error'] == 'Неверный код или он уже использован!') {
        return DomainError.invalidAuthCode(
          message: error.response!.data['error'],
        ).copyWith(code: error.response?.statusCode);
      }

      // Общая обработка ошибок
      final statusCode = error.response?.statusCode;
      final message = error.response?.statusMessage ?? 'Unknown error';

      switch (statusCode) {
        case 400:
          return DomainError.badRequest(message: message)
              .copyWith(code: statusCode);
        case 401:
          return DomainError.unauthorized(message: message)
              .copyWith(code: statusCode);
        case 403:
          return const DomainError.unauthorized(message: 'Forbidden')
              .copyWith(code: statusCode);
        case 404:
          return DomainError.notFound(message: message)
              .copyWith(code: statusCode);
        case 500:
        case 502:
        case 503:
          return DomainError.serverError(message: message)
              .copyWith(code: statusCode);
        default:
          return DomainError.networkError(message: message)
              .copyWith(code: statusCode);
      }
    } catch (e) {
      return DomainError.unknown(message: 'Failed to parse error: ${e.toString()}');
    }
  }
}