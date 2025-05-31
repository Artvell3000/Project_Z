//@GeneratedMicroModule;ShopNetworkPackageModule;package:shop_network/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:dio/dio.dart' as _i361;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shop_domain/domain/repositories/repositories.dart' as _i1027;
import 'package:shop_network/datasource/service/api_service.dart' as _i1050;
import 'package:shop_network/di/di.dart' as _i418;

class ShopNetworkPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final networkModule = _$NetworkModule();
    gh.singleton<_i361.Dio>(() => networkModule.dio);
    gh.singleton<_i1050.ApiService>(() => networkModule.apiService);
    gh.singleton<_i1027.IAuthRepository>(() => networkModule.iAuthRepository);
    gh.singleton<_i1027.IBasketRepository>(
        () => networkModule.iBasketRepository);
    gh.singleton<_i1027.ICategoryRepository>(
        () => networkModule.iCategoryRepository);
    gh.singleton<_i1027.INewsRepository>(() => networkModule.iNewsRepository);
    gh.singleton<_i1027.IOrderRepository>(() => networkModule.iOrderRepository);
    gh.singleton<_i1027.IProductRepository>(
        () => networkModule.iProductRepository);
    gh.singleton<_i1027.IUserRepository>(() => networkModule.iUserRepository);
  }
}

class _$NetworkModule extends _i418.NetworkModule {}
