
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_domain/domain/entity/tokens/tokens.dart';
import 'package:shop_domain/domain/repositories/auth_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';
import 'package:shop_network/network/entity/send_code/send_code_request.dart';
import 'package:shop_network/network/entity/verify_code/verify_code_request.dart';
import 'package:shop_network/network/mappers/error_mapper.dart';
import 'package:shop_network/network/service/auth_api_service/auth_api_service.dart';

@Injectable(as: IAuthRepository)
class ApiAuthRepository implements IAuthRepository{
  ApiAuthRepository(this._api);
  final AuthApiService _api;


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