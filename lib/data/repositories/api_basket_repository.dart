import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:project_z/core/domain/entity/basket/basket.dart';
import 'package:project_z/core/domain/repositories/basket_repository.dart';
import 'package:project_z/core/error/entity/domain_exception.dart';
import 'package:project_z/core/error/mappers/domain_exceptions_mapper.dart';
import 'package:project_z/core/network/api/mappers/basket_mapper.dart';
import 'package:project_z/core/network/api/entity/entity.dart';
import 'package:project_z/core/network/api/service/api_service.dart';

@Injectable(as: IBasketRepository)
class ApiBasketRepository implements IBasketRepository {
  ApiBasketRepository(this._apiService);

  final ApiService _apiService;

  @override
  Future<Either<DomainError, List<BasketItem>>> getMyBasket(String token, {int? page}) async {
    try {
      final response = await _apiService.getMyBasketItems(token: 'Bearer $token', page: page);
      return Right(response.toDomain());
    } on DioException catch (e) {
      return Left(DomainErrorMapper.mapDio(e));
    } on Exception catch (e) {
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }

  @override
  Future<Either<DomainError, BasketItem>> addToBasket(String token, int productId) async {
    try {
      final response = await _apiService.createBasketItem('Bearer $token', BasketItemCompanion(productId: productId));
      return Right(response.toDomain());
    } on DioException catch (e) {
      return Left(DomainErrorMapper.mapDio(e));
    } on Exception catch (e) {
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }

  @override
  Future<Either<DomainError, void>> remove(String token, int id) async {
    try {
      await _apiService.deleteBasketItem('Bearer $token', id);
      return const Right(null);
    } on DioException catch (e) {
      return Left(DomainErrorMapper.mapDio(e));
    } on Exception catch (e) {
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }

  @override
  Future<Either<DomainError, BasketItem>> updateAmount(String token,
      {required int id, required int productId, required int amount}) async {
    try {
      final response = await _apiService.updateBasketItem(
          'Bearer $token', id, BasketItemCompanion(productId: productId, amount: amount));
      return Right(response.toDomain());
    } on DioException catch (e) {
      return Left(DomainErrorMapper.mapDio(e));
    } on Exception catch (e) {
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }
}
