
import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:shop_domain/domain/entity/tokens/tokens.dart';
import 'package:shop_domain/domain/repositories/auth_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';
import 'package:shop_network/datasource/entity/send_code/send_code_request.dart';
import 'package:shop_network/datasource/entity/verify_code/verify_code_request.dart';
import 'package:shop_network/datasource/mappers/error_mapper.dart';
import 'package:shop_network/datasource/service/api_service.dart';

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