import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_network/network/service/api_services.dart';
import 'package:shop_network/network/service/interceptors/logging_interceptor.dart';

@microPackageInit
void initMicroPackage() {}

@module
abstract class NetworkModule {
  @singleton
  TokenStorageService get tokenStorage => TokenStorageService();

  @singleton
  AuthApiService get authApiService => AuthApiService(Dio()..interceptors.add(SaveTokenInterceptor(tokenStorage)));

  @singleton
  UserApiService get userApiService => UserApiService(Dio()..interceptors.addAll([
    AddTokenInterceptor(tokenStorage),
    LoggingInterceptor(),
  ]));

  @singleton
  CatalogApiService get catalogApiService => CatalogApiService(Dio()..interceptors.add(LoggingInterceptor()));
}