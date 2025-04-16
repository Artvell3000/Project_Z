import 'package:dio/dio.dart' hide Headers;
import 'package:project_z/core/domain/entity/entity.dart';
import 'package:project_z/core/network/api/request_models/request_models.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://online-shop.milliybiz.uz/')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @GET('categories/')
  Future<CategoryList> getCategories();

  @GET('categories/{id}/')
  Future<Category> getCategoryById(
      @Path('id') int id,
      );

  @GET('news/')
  Future<NewsList> getNews();

  @GET('order/')
  Future<PaginatedOrderItems> getOrder({
    @Header('Authorization') required String token,
  });

  @GET('products/')
  Future<ProductList> getProducts();

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
  Future<Product> getProductById(
    @Path('id') int productId,
  );

  @GET('auth/users/me/')
  Future<CustomUser> getCurrentUser(
    @Header('Authorization') String token,
  );

  @PATCH('auth/users/me/')
  @Headers({
    'Content-Type': 'application/json',
  })
  Future<CustomUser> updateCurrentUser(
    @Header('Authorization') String token,
    @Body() CustomUserCompanion user,
  );

  // Basket endpoints
  @GET('basket/')
  Future< PaginatedBasketItems> getBasketList({
    @Header('Authorization') required String token,
    @Query('search') String? search,
    @Query('page') int? page,
  });

  @POST('basket/')
  @Headers({'Content-Type': 'application/json'})
  Future<BasketItem> createBasketItem(
      @Header('Authorization') String token,
      @Body() BasketItemRequest request,
      );

  @GET('basket/my-basket/')
  Future< PaginatedBasketItems> getMyBasketItems({
    @Header('Authorization') required String token,
    @Query('search') String? search,
    @Query('page') int? page,
  });

  @GET('basket/{id}/')
  Future<BasketItem> getBasketItem(
      @Header('Authorization') String token,
      @Path('id') int basketItemId,
      );

  @PUT('basket/{id}/')
  @Headers({'Content-Type': 'application/json'})
  Future<BasketItem> updateBasketItem(
      @Header('Authorization') String token,
      @Path('id') int basketItemId,
      @Body() BasketItemRequest request,
      );

  @PATCH('basket/{id}/')
  @Headers({'Content-Type': 'application/json'})
  Future<BasketItem> partialUpdateBasketItem(
      @Header('Authorization')  String token,
      @Path('id') int basketItemId,
      @Body() BasketItemRequest request,
      );

  @DELETE('basket/{id}/')
  Future<void> deleteBasketItem(
      @Header('Authorization') String token,
      @Path('id') int basketItemId,
      );
}
