//@GeneratedMicroModule;ShopNetworkPackageModule;package:shop_network/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:shop_domain/domain/repositories/auth_repository.dart' as _i105;
import 'package:shop_domain/domain/repositories/basket_repository.dart' as _i75;
import 'package:shop_domain/domain/repositories/category_repository.dart'
    as _i547;
import 'package:shop_domain/domain/repositories/news_repository.dart' as _i307;
import 'package:shop_domain/domain/repositories/order_repository.dart' as _i523;
import 'package:shop_domain/domain/repositories/product_repository.dart'
    as _i401;
import 'package:shop_domain/domain/repositories/user_repository.dart' as _i900;
import 'package:shop_network/di/di.dart' as _i418;
import 'package:shop_network/network/service/api_services.dart' as _i901;
import 'package:shop_network/network/service/auth_api_service/auth_api_service.dart'
    as _i606;
import 'package:shop_network/network/service/catalog_api_service/catalog_api_service.dart'
    as _i312;
import 'package:shop_network/network/service/user_api_service/user_api_service.dart'
    as _i849;
import 'package:shop_network/repositories/api_auth_repository.dart' as _i503;
import 'package:shop_network/repositories/api_basket_repository.dart' as _i465;
import 'package:shop_network/repositories/api_category_repository.dart'
    as _i1024;
import 'package:shop_network/repositories/api_news_repository.dart' as _i413;
import 'package:shop_network/repositories/api_order_repository.dart' as _i36;
import 'package:shop_network/repositories/api_product_repository.dart' as _i999;
import 'package:shop_network/repositories/api_user_repositiry.dart' as _i208;

class ShopNetworkPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final networkModule = _$NetworkModule();
    gh.singleton<_i901.TokenStorageService>(() => networkModule.tokenStorage);
    gh.singleton<_i901.AuthApiService>(() => networkModule.authApiService);
    gh.singleton<_i901.UserApiService>(() => networkModule.userApiService);
    gh.singleton<_i901.CatalogApiService>(
        () => networkModule.catalogApiService);
    gh.factory<_i900.IUserRepository>(
        () => _i208.ApiUserRepository(gh<_i901.UserApiService>()));
    gh.factory<_i547.ICategoryRepository>(
        () => _i1024.ApiCategoryRepository(gh<_i312.CatalogApiService>()));
    gh.factory<_i523.IOrderRepository>(
        () => _i36.ApiOrderRepository(gh<_i901.UserApiService>()));
    gh.factory<_i401.IProductRepository>(
        () => _i999.ApiProductRepository(gh<_i901.CatalogApiService>()));
    gh.factory<_i307.INewsRepository>(
        () => _i413.ApiNewsRepository(gh<_i312.CatalogApiService>()));
    gh.factory<_i105.IAuthRepository>(
        () => _i503.ApiAuthRepository(gh<_i606.AuthApiService>()));
    gh.factory<_i75.IBasketRepository>(
        () => _i465.ApiBasketRepository(gh<_i849.UserApiService>()));
  }
}

class _$NetworkModule extends _i418.NetworkModule {}
