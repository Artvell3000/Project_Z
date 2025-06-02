import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:shop_network/datasource/entity/entity.dart';
import 'package:shop_network/datasource/service/api_config.dart';
import 'package:shop_network/datasource/service/logging_interceptor.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConfig.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.interceptors.add(LoggingInterceptor());
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET('categories/')
  Future<PaginatedCategoryDTO> getCategories({
    @Query('page') int? page,
  });

  @GET('categories/{id}/')
  Future<CategoryDTO> getCategoryById(
    @Path('id') int id,
  );

  @GET('categories/subcategory/{category_id}/')
  Future<PaginatedCategoryDTO> getSubcategoriesByParentId(
    @Path('category_id') int id, {
    @Query('search') String? search,
    @Query('page') int? page,
  });

  @GET('news/')
  Future<PaginatedNewsDTO> getNews({
    @Query('page') int? page,
  });



  @GET('products/')
  Future<PaginatedProductDTO> getProducts({
    @Query('page') int? page,
  });

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

  @GET('products/')
  Future<PaginatedProductDTO> searchProducts({
    @Query('lang') String? lang,
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
  Future<ProductDTO> getProductById(
    @Path('id') int productId,
  );

  @GET('auth/users/me/')
  Future<CustomUserDTO> getCurrentUser(
    @Header('Authorization') String token,
  );

  @PATCH('auth/users/me/')
  @Headers({
    'Content-Type': 'application/json',
  })
  Future<CustomUserDTO> updateCurrentUser(
    @Header('Authorization') String token,
    @Body() CustomUserCompanion user,
  );

  // Basket endpoints
  @GET('basket/')
  Future<PaginatedBasketItemsDTO> getBasketList({
    @Header('Authorization') required String token,
    @Query('search') String? search,
    @Query('page') int? page,
  });

  @POST('basket/')
  @Headers({'Content-Type': 'application/json'})
  Future<BasketItemDTO> createBasketItem(
    @Header('Authorization') String token,
    @Body() BasketItemCompanion request,
  );

  @GET('basket/my-basket/')
  @Headers({'Content-Type': 'application/json'})
  Future<List<BasketItemDTO>> getMyBasketItems({
    @Header('Authorization') required String token,
    @Query('search') String? search,
    @Query('page') int? page,
  });

  @GET('basket/{id}/')
  Future<BasketItemDTO> getBasketItem(
    @Header('Authorization') String token,
    @Path('id') int basketItemId,
  );

  @PUT('basket/{id}/')
  @Headers({'Content-Type': 'application/json'})
  Future<BasketItemDTO> updateBasketItem(
    @Header('Authorization') String token,
    @Path('id') int basketItemId,
    @Body() BasketItemCompanion request,
  );

  @PATCH('basket/{id}/')
  @Headers({'Content-Type': 'application/json'})
  Future<BasketItemDTO> partialUpdateBasketItem(
    @Header('Authorization') String token,
    @Path('id') int basketItemId,
    @Body() BasketItemCompanion request,
  );

  @DELETE('basket/{id}/')
  Future<void> deleteBasketItem(
    @Header('Authorization') String token,
    @Path('id') int basketItemId,
  );

  // Orders endpoints
  @GET('orders/')
  Future<PaginatedOrderItemsDTO> getOrder({
    @Header('Authorization') required String token,
    @Query('page') int? page,
  });

  @POST('orders/create/')
  @Headers({'Content-Type': 'application/json'})
  Future<void> createOrder(
    @Header('Authorization') String token,
    @Body() OrderCompanion request,
  );
}
