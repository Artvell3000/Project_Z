import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_domain/domain/entity/custom_user/custom_user.dart';
import 'package:shop_domain/domain/repositories/user_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';
import 'package:shop_network/network/entity/user/custom_user.dart';
import 'package:shop_network/network/mappers/error_mapper.dart';
import 'package:shop_network/network/mappers/user_mapper.dart';
import 'package:shop_network/network/service/api_services.dart';

@Injectable(as: IUserRepository)
class ApiUserRepository implements IUserRepository{
  final UserApiService _apiService;
  ApiUserRepository(this._apiService);

  @override
  Future<Either<DomainError, CustomUser>> getUser() async {
    try{
      final user = await _apiService.getCurrentUser();
      return Right(user.toDomain());
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.map(e));
    }
  }

  @override
  Future<Either<DomainError, CustomUser>> refreshDistinct(String distinct) async {
    try{
      final user = await _apiService.updateCurrentUser(CustomUserCompanion(district: distinct));
      return Right(user.toDomain());
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.map(e));
    }
  }

  @override
  Future<Either<DomainError, CustomUser>> refreshFullName(String fullName) async {
    try{
      final user = await _apiService.updateCurrentUser(CustomUserCompanion(fullName: fullName));
      return Right(user.toDomain());
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.map(e));
    }
  }

  @override
  Future<Either<DomainError, CustomUser>> refreshTown(String town) async {
    try{
      final user = await _apiService.updateCurrentUser(CustomUserCompanion(town: town));
      return Right(user.toDomain());
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.map(e));
    }
  }

  @override
  Future<Either<DomainError, CustomUser>> refreshUsername(String username) async {
    try{
      final user = await _apiService.updateCurrentUser(CustomUserCompanion(username: username));
      return Right(user.toDomain());
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.map(e));
    }
  }

}