import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_domain/domain/entity/product/product.dart';
import 'package:shop_domain/domain/entity/search_filter/search_filter.dart';
import 'package:shop_domain/domain/repositories/product_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';
import 'package:shop_network/network/mappers/error_mapper.dart';
import 'package:shop_network/network/mappers/product_mapper.dart';
import 'package:shop_network/network/service/api_services.dart';

@Injectable(as: IProductRepository)
class ApiProductRepository implements IProductRepository{
  ApiProductRepository(this._apiService);
  final CatalogApiService _apiService;

  @override
  Future<Either<DomainError, ProductPage>> getByFilter(SearchFilter filter, {String? lang, int? page}) async {
    try{
      final response = await _apiService.searchProducts(
        page: page,
        status: filter.status,
        minPrice: filter.from?.toString(),
        maxPrice: filter.to?.toString(),
        subcategory: filter.enabled?.id.toString(),
        name: filter.search,
        lang: lang
      );
      return Right(response.toDomain());
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.map(e));
    }
  }

  @override
  Future<Either<DomainError, ProductPage>> getByPage({int? page}) async {
    try{
      final response = await _apiService.searchProducts(page: page);
      return Right(response.toDomain());
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.map(e));
    }
  }

  @override
  Future<Either<DomainError, ProductPage>> getByStatus(String status, {int? page}) async {
    try{
      final page = await _apiService.searchProducts(
        status: status
      );
      return Right(page.toDomain());
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.map(e));
    }
  }

  @override
  Future<Either<DomainError, Product>> getById(int id) async {
    try{
      final product = await _apiService.getProductById(id);
      return Right(product.toDomain());
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.map(e));
    }
  }
}