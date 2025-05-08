import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart' as fp;
import 'package:injectable/injectable.dart' as di;
import 'package:logger/logger.dart';
import 'package:project_z/core/domain/entity/order/order.dart';
import 'package:project_z/core/domain/repositories/order_repository.dart';
import 'package:project_z/core/error/entity/domain_exception.dart';
import 'package:project_z/core/error/mappers/domain_exceptions_mapper.dart';
import 'package:project_z/core/network/api/entity/entity.dart';
import 'package:project_z/core/network/api/mappers/order_mapper.dart';
import 'package:project_z/core/network/api/service/api_service.dart';

@di.Injectable(as: IOrderRepository)
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
      Logger().i(user.toString());
      final orderPage = await _apiService.createOrder('Bearer $token', OrderCompanion(user: user.id));
      return const fp.Right(null);
    } on DioException catch (e){
      return fp.Left(DomainErrorMapper.mapDio(e));
    }
    on Exception catch (e){
      return fp.Left(DomainErrorMapper.mapUnknown(e));
    }
  }
}