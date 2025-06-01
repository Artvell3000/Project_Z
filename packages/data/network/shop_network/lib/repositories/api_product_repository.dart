import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shop_domain/domain/entity/product/product.dart';
import 'package:shop_domain/domain/entity/search_filter/search_filter.dart';
import 'package:shop_domain/domain/repositories/product_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';
import 'package:shop_network/datasource/mappers/error_mapper.dart';
import 'package:shop_network/datasource/mappers/product_mapper.dart';
import 'package:shop_network/datasource/service/api_service.dart';


class ApiProductRepository implements IProductRepository{
  ApiProductRepository(this._apiService);
  final ApiService _apiService;

  @override
  Future<Either<DomainError, ProductPage>> getByFilter(SearchFilter filter, String lang, {int? page}) async {
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
    } on DioException catch (e){
      return Left(DomainErrorMapper.mapDio(e));
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }

  @override
  Future<Either<DomainError, ProductPage>> getByPage({int? page}) async {
    try{
      final response = await _apiService.searchProducts(page: page);
      return Right(response.toDomain());
    } on DioException catch (e){
      return Left(DomainErrorMapper.mapDio(e));
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }

  @override
  Future<Either<DomainError, ProductPage>> getByStatus(String status, {int? page}) async {
    try{
      final page = await _apiService.searchProducts(
        status: status
      );
      return Right(page.toDomain());
    } on DioException catch (e){
      return Left(DomainErrorMapper.mapDio(e));
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }

  @override
  Future<Either<DomainError, Product>> getById(int id) async {
    try{
      final product = await _apiService.getProductById(id);
      return Right(product.toDomain());
    } on DioException catch (e){
      return Left(DomainErrorMapper.mapDio(e));
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }
}