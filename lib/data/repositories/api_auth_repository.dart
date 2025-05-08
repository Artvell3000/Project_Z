import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:project_z/core/domain/entity/tokens/tokens.dart';
import 'package:project_z/core/domain/repositories/auth_repository.dart';
import 'package:project_z/core/error/entity/domain_exception.dart';
import 'package:project_z/core/error/mappers/domain_exceptions_mapper.dart';
import 'package:project_z/core/network/api/entity/entity.dart';
import 'package:project_z/core/network/api/service/api_service.dart';

@Injectable(as: IAuthRepository)
class ApiAuthRepository implements IAuthRepository{
  ApiAuthRepository(this._api);
  final ApiService _api;


  @override
  Future<Either<DomainError, String>> sendCode(String username) async {
    try {
      final response = await _api.sendVerificationCode(SendCodeRequest(username: username));
      return Right(response.code);
    } on DioException catch (e){
      return Left(DomainErrorMapper.mapDio(e));
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }

  @override
  Future<Either<DomainError, AuthTokens>> verifyCode(String username,String code) async {
    try{
      final response = await _api.verifyCode(VerifyCodeRequest(username: username, code: code));
      return Right(AuthTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      ));
    } on DioException catch (e){
      return Left(DomainErrorMapper.mapDio(e));
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }
}