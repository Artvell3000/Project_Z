import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:project_z/core/domain/entity/custom_user/custom_user.dart';
import 'package:project_z/core/domain/repositories/user_repository.dart';
import 'package:project_z/core/error/entity/domain_exception.dart';
import 'package:project_z/core/error/mappers/domain_exceptions_mapper.dart';
import 'package:project_z/core/network/api/entity/entity.dart';
import 'package:project_z/core/network/api/mappers/user_mapper.dart';
import 'package:project_z/core/network/api/service/api_service.dart';

@Injectable(as: IUserRepository)
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