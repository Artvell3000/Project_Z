import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorageService {
  final FlutterSecureStorage _secureStorage;
  String? _accessToken;

  static const String _refreshTokenKey = 'refresh_token';

  TokenStorageService() : _secureStorage = const FlutterSecureStorage();

  /// Получить access token из памяти
  String? get accessToken => _accessToken;

  /// Установить access token в память
  set accessToken(String? token) {
    _accessToken = token;
  }

  /// Получить refresh token из защищенного хранилища
  Future<String?> get refreshToken async {
    return await _secureStorage.read(key: _refreshTokenKey);
  }

  /// Сохранить refresh token в защищенное хранилище
  Future<void> saveRefreshToken(String? token) async {
    if (token == null) {
      await _secureStorage.delete(key: _refreshTokenKey);
    } else {
      await _secureStorage.write(key: _refreshTokenKey, value: token);
    }
  }

  /// Очистить все токены
  Future<void> clearTokens() async {
    _accessToken = null;
    await _secureStorage.delete(key: _refreshTokenKey);
  }

  /// Проверить, есть ли сохраненные токены
  Future<bool> hasTokens() async {
    final refreshToken = await this.refreshToken;
    return _accessToken != null && refreshToken != null;
  }
} 