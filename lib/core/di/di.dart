import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:project_z/core/network/api/service/api_service.dart';
import 'package:project_z/features/product/presentation/bloc/product_screen_bloc.dart';
import 'package:project_z/features/search/presentation/bloc/search_filter.dart';
import 'package:project_z/features/search/presentation/bloc/search_screen_bloc.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // Функция инициализации
  preferRelativeImports: true,
  asExtension: false, // Для совместимости
)
void configureDependencies() {
  init(getIt);
  getIt.unregister<SearchScreenBloc>();
  getIt.registerFactoryParam<SearchScreenBloc, SearchFilter?, void>(
        (filter, _) => SearchScreenBloc(getIt<ApiService>(), initFilter: filter,),
  );
  getIt.unregister<ProductScreenBloc>();
  getIt.registerFactoryParam<ProductScreenBloc, int, void>(
        (id,_) => ProductScreenBloc(id, getIt<ApiService>()),
  );
}

@module
abstract class AppModule {
  @singleton
  Dio get dio => Dio();

  @singleton
  ApiService get apiService => ApiService(dio);
}