//@GeneratedMicroModule;ShopHivePackageModule;package:shop_hive/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:shop_domain/domain/repositories/local_lang_repository.dart'
    as _i1062;
import 'package:shop_domain/domain/repositories/local_phone_repository.dart'
    as _i420;
import 'package:shop_domain/domain/repositories/search_history_repository.dart'
    as _i840;
import 'package:shop_hive/datasource/lang/service/hive_used_lang_service.dart'
    as _i594;
import 'package:shop_hive/datasource/search_history/service/hive_search_history_service.dart'
    as _i390;
import 'package:shop_hive/datasource/user_phone/service/hive_user_phone_service.dart'
    as _i103;
import 'package:shop_hive/repositories/hive_phone_repository.dart' as _i949;
import 'package:shop_hive/repositories/hive_search_history_repository.dart'
    as _i743;
import 'package:shop_hive/repositories/hive_used_lang_repository.dart' as _i606;

class ShopHivePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i390.HiveSearchHistoryService>(
        () => _i390.HiveSearchHistoryService());
    gh.factory<_i103.HiveUserPhoneService>(() => _i103.HiveUserPhoneService());
    gh.factory<_i594.HiveLocalLangService>(() => _i594.HiveLocalLangService());
    gh.factory<_i420.ILocalPhoneRepository>(
        () => _i949.HivePhoneRepository(gh<_i103.HiveUserPhoneService>()));
    gh.factory<_i1062.ILocalLangRepository>(
        () => _i606.HiveLocalLangRepository(gh<_i594.HiveLocalLangService>()));
    gh.factory<_i840.ISearchHistoryRepository>(() =>
        _i743.HiveSearchHistoryRepository(
            gh<_i390.HiveSearchHistoryService>()));
  }
}
