import 'dart:io';
import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:project_z/core/domain/entity/tokens/tokens.dart';

class TokenJsonLoader {
  final String _tokensFileName = 'tokens.json';
  final Directory _appDirectory;

  TokenJsonLoader(this._appDirectory);

  Future<Either<Exception, AuthTokens?>> find() async {
    try {
      final file = File('${_appDirectory.path}/$_tokensFileName');

      if (!await file.exists()) {
        return right(null);
      }

      final content = await file.readAsString();
      final json = jsonDecode(content) as Map<String, dynamic>;
      final tokens = AuthTokens.fromJson(json);

      return Either.right(tokens);
    } catch (e) {
      return Either.left(Exception('Ошибка при поиске токенов: $e'));
    }
  }

  Future<Exception?> save(AuthTokens tokens) async {
    try {
      final file = File('${_appDirectory.path}/$_tokensFileName');
      final json = tokens.toJson();
      await file.writeAsString(jsonEncode(json));
      return null;
    } catch (e) {
      return Exception('Ошибка при сохранении токенов: $e');
    }
  }
}
