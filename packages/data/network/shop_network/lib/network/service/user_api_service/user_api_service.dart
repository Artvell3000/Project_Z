import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:shop_network/network/entity/entity.dart';
import 'package:shop_network/network/service/api_config.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: ApiConfig.baseUrl)
abstract class UserApiService {
  factory UserApiService(Dio dio, {String? baseUrl}) => _UserApiService(dio, baseUrl: baseUrl);

  @GET('auth/users/me/')
  Future<CustomUserDTO> getCurrentUser();

  @PATCH('auth/users/me/')
  @Headers({
    'Content-Type': 'application/json',
  })
  Future<CustomUserDTO> updateCurrentUser(@Body() CustomUserCompanion user);

  // Basket endpoints
  @GET('basket/')
  Future<PaginatedBasketItemsDTO> getBasketList({
    @Query('search') String? search,
    @Query('page') int? page,
  });

  @POST('basket/')
  @Headers({'Content-Type': 'application/json'})
  Future<BasketItemDTO> createBasketItem(
    @Body() BasketItemCompanion request,
  );

  @GET('basket/my-basket/')
  @Headers({'Content-Type': 'application/json'})
  Future<List<BasketItemDTO>> getMyBasketItems({
    @Query('search') String? search,
    @Query('page') int? page,
  });

  @GET('basket/{id}/')
  Future<BasketItemDTO> getBasketItem(
    @Path('id') int basketItemId,
  );

  @PUT('basket/{id}/')
  @Headers({'Content-Type': 'application/json'})
  Future<BasketItemDTO> updateBasketItem(
    @Path('id') int basketItemId,
    @Body() BasketItemCompanion request,
  );

  @PATCH('basket/{id}/')
  @Headers({'Content-Type': 'application/json'})
  Future<BasketItemDTO> partialUpdateBasketItem(
    @Path('id') int basketItemId,
    @Body() BasketItemCompanion request,
  );

  @DELETE('basket/{id}/')
  Future<void> deleteBasketItem(
    @Path('id') int basketItemId,
  );

  // Orders endpoints
  @GET('orders/')
  Future<PaginatedOrderItemsDTO> getOrder({
    @Query('page') int? page,
  });

  @POST('orders/create/')
  @Headers({'Content-Type': 'application/json'})
  Future<void> createOrder(
    @Body() OrderCompanion request,
  );
} 