import 'package:fpdart/fpdart.dart';
import 'package:project_z/core/domain/entity/basket/basket.dart';
import 'package:project_z/core/domain/repositories/basket_repository.dart';
import 'package:project_z/core/network/api/service/api_service.dart';

class ApiBasketRepository implements IBasketRepository {
  ApiBasketRepository(this._apiService);
  final ApiService _apiService;

  @override
  Future<Either<Exception, PaginatedBasketItems>> getBasketList({
    String? search,
    int? page,
    required String token
  }) async {
    try {
      final response = await _apiService.getBasketList(
        search: search,
        page: page,
        token: 'Bearer $token'
      );
      return Either.right(response);
    } on Exception catch (e) {
      return Either.left(e);
    }
  }

  @override
  Future<Either<Exception, PaginatedBasketItems>> getMyBasketItems({
    String? search,
    int? page,
    required String token
  }) async {
    try {
      final response = await _apiService.getMyBasketItems(
        search: search,
        page: page,
          token: 'Bearer $token'
      );
      return Either.right(response);
    } on Exception catch (e) {
      return Either.left(e);
    }
  }

  @override
  Future<Either<Exception, BasketItem>> getBasketItem(int basketItemId, String token) async {
    try {
      final response = await _apiService.getBasketItem('Bearer $token',basketItemId);
      return Either.right(response);
    } on Exception catch (e) {
      return Either.left(e);
    }
  }

  @override
  Future<Either<Exception, BasketItem>> addToBasket(BasketItemRequest request, String token) async {
    try {
      final response = await _apiService.createBasketItem('Bearer $token',request);
      return Either.right(response);
    } on Exception catch (e) {
      return Either.left(e);
    }
  }

  @override
  Future<Either<Exception, BasketItem>> updateBasketItem(
      int basketItemId,
      BasketItemRequest request,
      String token
      ) async {
    try {
      final response = await _apiService.updateBasketItem(
        'Bearer $token',
        basketItemId,
        request,
      );
      return Either.right(response);
    } on Exception catch (e) {
      return Either.left(e);
    }
  }

  @override
  Future<Either<Exception, BasketItem>> partialUpdateBasketItem(
      int basketItemId,
      BasketItemRequest request,
      String token
      ) async {
    try {
      final response = await _apiService.partialUpdateBasketItem(
        'Bearer $token',
        basketItemId,
        request,
      );
      return Either.right(response);
    } on Exception catch (e) {
      return Either.left(e);
    }
  }

  @override
  Future<Either<Exception, void>> removeFromBasket(int basketItemId, String token) async {
    try {
      await _apiService.deleteBasketItem('Bearer $token',basketItemId);
      return Either.right(null);
    } on Exception catch (e) {
      return Either.left(e);
    }
  }
}