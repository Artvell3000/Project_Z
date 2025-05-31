import 'package:injectable/injectable.dart';
import 'package:shop_domain/domain/repositories/local_lang_repository.dart';
import 'package:shop_domain/domain/repositories/repositories.dart';
import 'package:shop_hive/datasource/lang/service/hive_used_lang_service.dart';
import 'package:shop_hive/datasource/search_history/service/hive_search_history_service.dart';
import 'package:shop_hive/datasource/tokens/service/hive_tokens_service.dart';
import 'package:shop_hive/datasource/user_phone/service/hive_user_phone_service.dart';
import 'package:shop_hive/repositories/hive_phone_repository.dart';
import 'package:shop_hive/repositories/hive_search_history_repository.dart';
import 'package:shop_hive/repositories/hive_tokens_repository.dart';
import 'package:shop_hive/repositories/hive_used_lang_repository.dart';

@microPackageInit
void initMicroPackage() {}

@module
abstract class HiveModule {
  @singleton
  HiveLocalLangService get hiveUsedLangService => HiveLocalLangService();

  @singleton
  HiveSearchHistoryService get hiveSearchHistoryService => HiveSearchHistoryService();

  @singleton
  HiveTokenService get hiveTokenService => HiveTokenService();

  @singleton
  HiveUserPhoneService get hiveUserPhoneService => HiveUserPhoneService();

  // repositories

  @singleton
  ILocalPhoneRepository get iLocalPhoneRepository => HivePhoneRepository(hiveUserPhoneService);

  @singleton
  ISearchHistoryRepository get iSearchHistoryRepository => HiveSearchHistoryRepository(hiveSearchHistoryService);

  @singleton
  ITokenRepository get iTokenRepository => HiveTokensRepository(hiveTokenService);

  @singleton
  ILocalLangRepository get iLocalLangRepository => HiveLocalLangRepository(hiveUsedLangService);
}