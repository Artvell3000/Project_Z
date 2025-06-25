import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_domain/domain/entity/basket/basket.dart';
import 'package:shop_domain/domain/repositories/basket_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';
import 'package:shop_network/network/entity/basket/basket.dart';
import 'package:shop_network/network/mappers/basket_mapper.dart';
import 'package:shop_network/network/mappers/error_mapper.dart';
import 'package:shop_network/network/service/user_api_service/user_api_service.dart';

@Injectable(as: IBasketRepository)
class ApiBasketRepository implements IBasketRepository {
  ApiBasketRepository(this._apiService);

  final UserApiService _apiService;

  @override
  Future<Either<DomainError, List<BasketItem>>> getMyBasket({int? page}) async {
    try {
      final response = await _apiService.getMyBasketItems(page: page);
      return Right(response.toDomain());
    } on Exception catch (e) {
      return Left(DomainErrorMapper.map(e));
    }
  }

  @override
  Future<Either<DomainError, BasketItem>> addToBasket(int productId) async {
    try {
      final response = await _apiService.createBasketItem(BasketItemCompanion(productId: productId));
      return Right(response.toDomain());
    } on Exception catch (e) {
      return Left(DomainErrorMapper.map(e));
    }
  }

  @override
  Future<Either<DomainError, void>> remove(int id) async {
    try {
      await _apiService.deleteBasketItem(id);
      return const Right(null);
    } on Exception catch (e) {
      return Left(DomainErrorMapper.map(e));
    }
  }

  @override
  Future<Either<DomainError, BasketItem>> updateAmount(
      {required int id, required int productId, required int amount}) async {
    try {
      final response = await _apiService.updateBasketItem(id, BasketItemCompanion(productId: productId, amount: amount));
      return Right(response.toDomain());
    } on Exception catch (e) {
      return Left(DomainErrorMapper.map(e));
    }
  }
}
