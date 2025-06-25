import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart' as fp;
import 'package:injectable/injectable.dart';
import 'package:shop_domain/domain/entity/order/order.dart';
import 'package:shop_domain/domain/repositories/order_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';
import 'package:shop_network/network/entity/order/order.dart';
import 'package:shop_network/network/mappers/error_mapper.dart';
import 'package:shop_network/network/mappers/order_mapper.dart';
import 'package:shop_network/network/service/api_services.dart';

@Injectable(as: IOrderRepository)
class ApiOrderRepository implements IOrderRepository{
  ApiOrderRepository(this._apiService);
  final UserApiService _apiService;

  @override
  Future<fp.Either<DomainError, PageOrder>> getByPage({int? page}) async {
    try{
      final orderPage = await _apiService.getOrder(page: page);
      return fp.Right(orderPage.toDomain());
    }
    on Exception catch (e){
      return fp.Left(DomainErrorMapper.map(e));
    }
  }

  @override
  Future<fp.Either<DomainError, void>> create() async {
    try{
      final user = await _apiService.getCurrentUser();
      await _apiService.createOrder(OrderCompanion(user: user.id));
      return const fp.Right(null);
    }
    on Exception catch (e){
      return fp.Left(DomainErrorMapper.map(e));
    }
  }
}