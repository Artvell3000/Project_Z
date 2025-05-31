import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shop_domain/domain/entity/custom_user/custom_user.dart';
import 'package:shop_domain/domain/repositories/user_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';
import 'package:shop_network/datasource/entity/user/custom_user.dart';
import 'package:shop_network/datasource/mappers/error_mapper.dart';
import 'package:shop_network/datasource/mappers/user_mapper.dart';
import 'package:shop_network/datasource/service/api_service.dart';


class ApiUserRepository implements IUserRepository{
  final ApiService _apiService;
  ApiUserRepository(this._apiService);

  @override
  Future<Either<DomainError, CustomUser>> getUser(String token) async {
    try{
      final user = await _apiService.getCurrentUser('Bearer $token');
      return Right(user.toDomain());
    } on DioException catch (e){
      return Left(DomainErrorMapper.mapDio(e));
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }

  @override
  Future<Either<DomainError, CustomUser>> refreshDistinct(String token, String distinct) async {
    try{
      final user = await _apiService.updateCurrentUser('Bearer $token', CustomUserCompanion(district: distinct));
      return Right(user.toDomain());
    } on DioException catch (e){
      return Left(DomainErrorMapper.mapDio(e));
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }

  @override
  Future<Either<DomainError, CustomUser>> refreshFullName(String token, String fullName) async {
    try{
      final user = await _apiService.updateCurrentUser('Bearer $token', CustomUserCompanion(fullName: fullName));
      return Right(user.toDomain());
    } on DioException catch (e){
      return Left(DomainErrorMapper.mapDio(e));
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }

  @override
  Future<Either<DomainError, CustomUser>> refreshTown(String token, String town) async {
    try{
      final user = await _apiService.updateCurrentUser('Bearer $token', CustomUserCompanion(town: town));
      return Right(user.toDomain());
    } on DioException catch (e){
      return Left(DomainErrorMapper.mapDio(e));
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }

  @override
  Future<Either<DomainError, CustomUser>> refreshUsername(String token, String username) async {
    try{
      final user = await _apiService.updateCurrentUser('Bearer $token', CustomUserCompanion(username: username));
      return Right(user.toDomain());
    } on DioException catch (e){
      return Left(DomainErrorMapper.mapDio(e));
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }

}