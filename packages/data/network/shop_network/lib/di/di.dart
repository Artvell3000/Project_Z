import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_domain/domain/repositories/repositories.dart';
import 'package:shop_network/datasource/service/api_service.dart';
import 'package:shop_network/repositories/repositories.dart';

@microPackageInit
void initMicroPackage() {}

@module
abstract class NetworkModule {
  @singleton
  Dio get dio => Dio();

  @singleton
  ApiService get apiService => ApiService(dio);

  @singleton
  IAuthRepository get iAuthRepository => ApiAuthRepository(apiService);

  @singleton 
  IBasketRepository get iBasketRepository => ApiBasketRepository(apiService);

  @singleton 
  ICategoryRepository get iCategoryRepository => ApiCategoryRepository(apiService);

  @singleton 
  INewsRepository get iNewsRepository => ApiNewsRepository(apiService);

  @singleton
  IOrderRepository get iOrderRepository => ApiOrderRepository(apiService);

  @singleton
  IProductRepository get iProductRepository => ApiProductRepository(apiService);

  @singleton
  IUserRepository get iUserRepository => ApiUserRepository(apiService);
}