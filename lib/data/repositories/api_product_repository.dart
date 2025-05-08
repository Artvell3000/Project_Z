import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:project_z/core/domain/entity/product/product.dart';
import 'package:project_z/core/domain/repositories/product_repository.dart';
import 'package:project_z/core/error/entity/domain_exception.dart';
import 'package:project_z/core/error/mappers/domain_exceptions_mapper.dart';
import 'package:project_z/core/network/api/mappers/product_mapper.dart';
import 'package:project_z/core/network/api/service/api_service.dart';
import 'package:project_z/features/search/domain/entity/search_filter.dart';

@Injectable(as: IProductRepository)
class ApiProductRepository implements IProductRepository{
  ApiProductRepository(this._apiService);
  final ApiService _apiService;

  @override
  Future<Either<DomainError, ProductPage>> getByFilter(SearchFilter filter, {int? page}) async {
    try{
      final response = await _apiService.searchProducts(
        page: page,
        status: filter.status,
        minPrice: filter.from?.toString(),
        maxPrice: filter.to?.toString(),
        subcategory: filter.enabled?.id.toString(),
        name: filter.search
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