import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:shop_network/network/entity/entity.dart';
import 'package:shop_network/network/service/api_config.dart';

part 'catalog_api_service.g.dart';

@RestApi(baseUrl: ApiConfig.baseUrl)
abstract class CatalogApiService {
  factory CatalogApiService(Dio dio, {String? baseUrl}) => _CatalogApiService(dio, baseUrl: baseUrl);

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
} 