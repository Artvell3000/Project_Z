import 'package:dio/dio.dart';
import 'package:shop_network/network/service/token/token_storage_service.dart';

class AddTokenInterceptor extends Interceptor {
  final TokenStorageService _tokenStorage;

  AddTokenInterceptor(this._tokenStorage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = _tokenStorage.accessToken;
    
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
      handler.next(options);
    } else {
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.badResponse,
          message: 'Access token is missing',
          response: Response(
            requestOptions: options,
            statusCode: 401,
            statusMessage: 'Unauthorized',
          ),
        ),
        true,
      );
    }
  }
} 