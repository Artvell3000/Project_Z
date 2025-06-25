import 'package:dio/dio.dart';
import 'package:shop_network/network/service/token/token_storage_service.dart';

class SaveTokenInterceptor extends Interceptor {
  final TokenStorageService _tokenStorage;

  SaveTokenInterceptor(this._tokenStorage);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final data = response.data;
    
    if (data is Map<String, dynamic>) {
      final accessToken = data['access_token'] as String?;
      final refreshToken = data['refresh_token'] as String?;

      if (accessToken != null) {
        _tokenStorage.accessToken = accessToken;
      }

      if (refreshToken != null) {
        await _tokenStorage.saveRefreshToken(refreshToken);
      }
    }

    handler.next(response);
  }
} 