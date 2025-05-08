import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:project_z/core/domain/repositories/category_repository.dart';
import 'package:project_z/core/domain/repositories/product_repository.dart';
import 'package:project_z/core/network/api/service/api_service.dart';
import 'package:project_z/features/search/domain/entity/search_filter.dart';
import 'package:project_z/features/search/presentation/bloc/filter_widget/filter_screen_bloc.dart';
import 'package:project_z/features/search/presentation/bloc/search_screen/search_screen_bloc.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() {
  init(getIt);
  getIt.unregister<SearchScreenBloc>();
  getIt.registerFactoryParam<SearchScreenBloc, SearchFilter, void>(
        (filter, _) => SearchScreenBloc(getIt<IProductRepository>(),filter,),
  );

  getIt.unregister<FilterScreenBloc>();
  getIt.registerFactoryParam<FilterScreenBloc, SearchFilter, void>(
        (filter, _) => FilterScreenBloc(getIt<ICategoryRepository>(),filter,),
  );
}

@module
abstract class AppModule {
  @singleton
  Dio get dio => Dio();

  @singleton
  ApiService get apiService => ApiService(dio);
}