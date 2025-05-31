

import 'package:shop_domain/domain/entity/tokens/tokens.dart';
import 'package:shop_hive/datasource/tokens/entity/hive_auth_tokens/hive_auth_tokens.dart';

extension AuthTokensHiveExtension on AuthTokens {
  HiveAuthTokens toHive() {
    return HiveAuthTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}

extension HiveAuthTokensDomainExtension on HiveAuthTokens {
  AuthTokens toDomain() {
    return AuthTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}

extension NullableHiveAuthTokensDomainExtension on HiveAuthTokens? {
  AuthTokens? toDomainNullable() {
    return this?.toDomain();
  }
}


class TokensMapper {
  static List<AuthTokens> fromHiveList(List<HiveAuthTokens> hiveTokensList) {
    return hiveTokensList.map((el) => el.toDomain()).toList();
  }

  static List<HiveAuthTokens> toHiveList(List<AuthTokens> tokensList) {
    return tokensList.map((el) => el.toHive()).toList();
  }
}