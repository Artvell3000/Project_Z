import 'package:fpdart/src/either.dart';
import 'package:project_z/core/domain/entity/order/order.dart';
import 'package:project_z/core/domain/repositories/order_repository.dart';
import 'package:project_z/core/network/api/service/api_service.dart';

class ApiOrderRepository implements IOrderRepository{
  ApiOrderRepository(this._apiService);
  final ApiService _apiService;

  @override
  Future<Either<Exception, PaginatedOrderItems>> getAll(String token) async {
    try{
      final orders = await _apiService.getOrder(token: token);
      return Either.right(orders);
    } on Exception catch(e){
      return Either.left(e);
    }
  }
}