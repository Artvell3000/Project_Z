import 'package:dio/dio.dart';
import 'package:project_z/core/domain/entity/entity.dart';
import 'package:project_z/core/network/api/request_models/send_code_request.dart';
import 'package:project_z/core/network/api/request_models/verify_code.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://online-shop.milliybiz.uz/')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @GET('/categories/')
  Future<CategoryList> getCategories();

  @GET('/news/')
  Future<NewsList> getNews();

  @GET('/products/')
  Future<ProductList> getProducts();

  @POST('auth/send-code/')
  Future<SendCodeResponse> sendVerificationCode(@Body() SendCodeRequest request,);

  @POST('/auth/verify-code/')
  Future<VerifyCodeResponse> verifyCode(@Body() VerifyCodeRequest request,);
}