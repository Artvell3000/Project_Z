import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:shop_network/network/entity/entity.dart';
import 'package:shop_network/network/service/api_config.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiConfig.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String? baseUrl}) => _AuthApiService(dio, baseUrl: baseUrl);

  @POST('auth/send-code/')
  @Headers({'Content-Type': 'application/json'})
  Future<SendCodeResponse> sendVerificationCode(
    @Body() SendCodeRequest request,
  );

  @Headers({'Content-Type': 'application/json'})
  @POST('auth/verify-code/')
  Future<VerifyCodeResponse> verifyCode(
    @Body() VerifyCodeRequest request,
  );
} 