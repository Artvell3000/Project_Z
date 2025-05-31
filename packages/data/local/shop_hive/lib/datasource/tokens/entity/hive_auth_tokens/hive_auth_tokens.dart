import 'package:hive/hive.dart';
import 'package:shop_hive/datasource/hive_config.dart';

part 'hive_auth_tokens.g.dart';

@HiveType(typeId: HiveConfig.authTokensTypeId)
class HiveAuthTokens {
  @HiveField(0)
  final String accessToken;

  @HiveField(1)
  final String refreshToken;

  HiveAuthTokens({
    required this.accessToken,
    required this.refreshToken,
  });
}

