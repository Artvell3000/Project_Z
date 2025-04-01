import 'package:dio/dio.dart';
import 'package:project_z/core/domain/entity/custom_user/custom_user.dart';
import 'package:project_z/core/domain/entity/entity.dart';
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

  // @POST('auth/send-code/')
  // Future<SendCodeResponse> sendVerificationCode(@Body() SendCodeRequest request,);
  //
  // @POST('/auth/verify-code/')
  // Future<VerifyCodeResponse> verifyCode(@Body() VerifyCodeRequest request,);

  @GET('/products/')
  Future<ProductList> searchProducts({
    @Query('name') String? name,
    @Query('subcategory') String? subcategory,
    @Query('status') String? status,
    @Query('min_price') String? minPrice,
    @Query('max_price') String? maxPrice,
    @Query('search') String? searchTerm,
    @Query('ordering') String? ordering,
    @Query('page') int? page,
  });

  @GET('products/{id}/')
  Future<Product> getProductById(@Path('id') int productId,);

  @GET('auth/users/me/')
  Future<UserList> getCurrentUser(
      @Header('token') String token,
      );
}