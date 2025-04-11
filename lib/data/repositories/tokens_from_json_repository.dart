import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:project_z/core/domain/entity/tokens/tokens.dart';
import 'package:project_z/core/domain/repositories/token_repository.dart';
import 'package:project_z/data/datasource/tokens_loader/tokens_json_loader.dart';
import 'package:path_provider/path_provider.dart';

@injectable
class TokensFromJsonRepository implements ITokenRepository {
  @override
  Future<Either<Exception, AuthTokens?>> find() async {
    final appDir = await getApplicationDocumentsDirectory();
    final loader = TokenJsonLoader(appDir);
    return await loader.find();
  }

  @override
  Future<Exception?> save(AuthTokens tokens) async {
    final appDir = await getApplicationDocumentsDirectory();
    final loader = TokenJsonLoader(appDir);
    return await loader.save(tokens);
  }
}
