import 'package:dio/dio.dart';
import '../logging_service.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    LoggingService.info('REQUEST[${options.method}] => PATH: ${options.path}');
    LoggingService.debug('Request Headers: ${options.headers}');
    if (options.data != null) {
      LoggingService.debug('Request Data: ${options.data}');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    LoggingService.info(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    LoggingService.debug('Response Data: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    LoggingService.error(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
      err,
      err.stackTrace,
    );
    super.onError(err, handler);
  }
} 