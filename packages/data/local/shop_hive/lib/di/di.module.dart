//@GeneratedMicroModule;ShopHivePackageModule;package:shop_hive/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:shop_domain/domain/repositories/local_lang_repository.dart'
    as _i1062;
import 'package:shop_domain/domain/repositories/repositories.dart' as _i1027;
import 'package:shop_hive/datasource/lang/service/hive_used_lang_service.dart'
    as _i594;
import 'package:shop_hive/datasource/search_history/service/hive_search_history_service.dart'
    as _i390;
import 'package:shop_hive/datasource/tokens/service/hive_tokens_service.dart'
    as _i567;
import 'package:shop_hive/datasource/user_phone/service/hive_user_phone_service.dart'
    as _i103;
import 'package:shop_hive/di/di.dart' as _i413;

class ShopHivePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final hiveModule = _$HiveModule();
    gh.singleton<_i594.HiveLocalLangService>(
        () => hiveModule.hiveUsedLangService);
    gh.singleton<_i390.HiveSearchHistoryService>(
        () => hiveModule.hiveSearchHistoryService);
    gh.singleton<_i567.HiveTokenService>(() => hiveModule.hiveTokenService);
    gh.singleton<_i103.HiveUserPhoneService>(
        () => hiveModule.hiveUserPhoneService);
    gh.singleton<_i1027.ILocalPhoneRepository>(
        () => hiveModule.iLocalPhoneRepository);
    gh.singleton<_i1027.ISearchHistoryRepository>(
        () => hiveModule.iSearchHistoryRepository);
    gh.singleton<_i1027.ITokenRepository>(() => hiveModule.iTokenRepository);
    gh.singleton<_i1062.ILocalLangRepository>(
        () => hiveModule.iLocalLangRepository);
  }
}

class _$HiveModule extends _i413.HiveModule {}
