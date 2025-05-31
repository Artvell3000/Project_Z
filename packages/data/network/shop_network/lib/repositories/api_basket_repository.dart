import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shop_domain/domain/entity/basket/basket.dart';
import 'package:shop_domain/domain/repositories/basket_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';
import 'package:shop_network/datasource/entity/basket/basket.dart';
import 'package:shop_network/datasource/mappers/basket_mapper.dart';
import 'package:shop_network/datasource/mappers/error_mapper.dart';
import 'package:shop_network/datasource/service/api_service.dart';

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
