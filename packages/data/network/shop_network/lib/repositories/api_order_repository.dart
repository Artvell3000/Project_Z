import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart' as fp;
import 'package:shop_domain/domain/entity/order/order.dart';
import 'package:shop_domain/domain/repositories/order_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';
import 'package:shop_network/datasource/entity/order/order.dart';
import 'package:shop_network/datasource/mappers/error_mapper.dart';
import 'package:shop_network/datasource/mappers/order_mapper.dart';
import 'package:shop_network/datasource/service/api_service.dart';


class ApiOrderRepository implements IOrderRepository{
  ApiOrderRepository(this._apiService);
  final ApiService _apiService;

  @override
  Future<fp.Either<DomainError, PageOrder>> getByPage(String token, {int? page}) async {
    try{
      final orderPage = await _apiService.getOrder(token: 'Bearer $token', page: page);
      return fp.Right(orderPage.toDomain());
    } on DioException catch (e){
      return fp.Left(DomainErrorMapper.mapDio(e));
    }
    on Exception catch (e){
      return fp.Left(DomainErrorMapper.mapUnknown(e));
    }
  }

  @override
  Future<fp.Either<DomainError, void>> create(String token) async {
    try{
      final user = await _apiService.getCurrentUser('Bearer $token');
      await _apiService.createOrder('Bearer $token', OrderCompanion(user: user.id));
      return const fp.Right(null);
    } on DioException catch (e){
      return fp.Left(DomainErrorMapper.mapDio(e));
    }
    on Exception catch (e){
      return fp.Left(DomainErrorMapper.mapUnknown(e));
    }
  }
}