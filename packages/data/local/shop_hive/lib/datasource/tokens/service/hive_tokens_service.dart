import 'package:hive_flutter/adapters.dart';
import 'package:shop_hive/datasource/hive_config.dart';
import 'package:shop_hive/datasource/tokens/entity/hive_auth_tokens/hive_auth_tokens.dart';



class HiveTokenService {
  static const _boxName = 'auth_tokens_box';
  static const _key = 'auth_token';

  Future<Box<HiveAuthTokens>> get _box async {
    await Hive.initFlutter();

    if(!Hive.isAdapterRegistered(HiveConfig.authTokensTypeId)){
      Hive.registerAdapter(HiveAuthTokensAdapter());
    }

    if (!Hive.isBoxOpen(_boxName)) {
      return await Hive.openBox<HiveAuthTokens>(_boxName);
    }
    return Hive.box<HiveAuthTokens>(_boxName);
  }

  Future<HiveAuthTokens?> find() async {
    final box = await _box;
    final tokens = box.get(_key);

    return tokens;
  }

  Future<void> save(HiveAuthTokens tokens) async {
    final box = await _box;
    await box.clear();
    await box.put(_key, tokens);
  }

  Future<void> clear() async {
    final box = await _box;
    await box.clear();
  }
}
