import 'package:fpdart/src/either.dart';
import 'package:logger/logger.dart';
import 'package:project_z/core/domain/entity/custom_user/custom_user.dart';
import 'package:project_z/core/domain/entity/tokens/tokens.dart';
import 'package:project_z/core/domain/repositories/auth_repository.dart';
import 'package:project_z/core/network/api/request_models/request_models.dart';
import 'package:project_z/core/network/api/request_models/send_code/send_code_request.dart';
import 'package:project_z/core/network/api/service/api_service.dart';

class ApiAuthRepository implements IAuthRepository{
  ApiAuthRepository(this._api);
  final ApiService _api;
  late AuthTokens _tokens;
  bool _hasAuth = false;

  @override
  bool get hasAuth => _hasAuth;

  @override
  AuthTokens get tokens{
    if(!_hasAuth) throw(Exception('_tokens not init'));
    return _tokens;
  }

  @override
  Future<Either<Exception,CustomUser>> setTokens(AuthTokens tokens) async {
    try{
      final response = await _api.getCurrentUser('Bearer ${tokens.accessToken}');
      _hasAuth = true;
      _tokens = tokens.copyWith();
      return Either.right(response);
    } catch (e){
      _hasAuth = false;
      return Either.left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception,CustomUser>> getUser() async {
    if(!_hasAuth)throw(Exception('user == null: use hasAuth!'));
    try{
      final response = await _api.getCurrentUser('Bearer ${_tokens.accessToken}');
      return Either.right(response);
    } catch (e){
      _hasAuth = false;
      return Either.left(Exception(e.toString()));
    }
  }


  @override
  Future<Either<Exception, String>> sendCode(String username) async {
    try {
      final response = await _api.sendVerificationCode(SendCodeRequest(username: username));
      return Either.right(response.code);
    } catch (e) {
      return Either.left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, AuthTokens>> verifyCode(String username,String code) async {
    try{
      final response = await _api.verifyCode(VerifyCodeRequest(username: username, code: code));
      _tokens = AuthTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );
      _hasAuth = true;
      return Either.right(_tokens.copyWith());

    } on Exception catch (e){
      return Either.left(e);
    }
  }

  @override
  Future<Either<Exception, CustomUser>> refreshUser(CustomUserCompanion newUser) async {
    try{
      Logger().i('start get user');
      final user = await _api.updateCurrentUser('Bearer ${_tokens.accessToken}', newUser);
      Logger().i('end get user $user');
      return Either.right(user);
    } catch (e){
      Logger().e('e : $e');
      return Either.left(Exception(e));
    }
  }

}