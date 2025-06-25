import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:project_z/features/search/presentation/bloc/filter_widget/filter_screen_bloc.dart';
import 'package:project_z/features/search/presentation/bloc/search_screen/search_screen_bloc.dart';
import 'package:shop_domain/domain/entity/search_filter/search_filter.dart';
import 'package:shop_domain/domain/repositories/category_repository.dart';
import 'package:shop_domain/domain/repositories/local_lang_repository.dart';
import 'package:shop_domain/domain/repositories/product_repository.dart';
import 'package:shop_domain/domain/use_case/search_product_use_case.dart';

import 'package:shop_network/di/di.module.dart';

import 'package:shop_hive/di/di.module.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
  includeMicroPackages: true,
  externalPackageModulesBefore: [
    ExternalModule(ShopHivePackageModule), 
    ExternalModule(ShopNetworkPackageModule) 
  ],
)
Future<void> configureDependencies() async {
  await init(getIt);

  getIt.registerFactory<SearchProductUseCase>(
    () => SearchProductUseCase(
      getIt<ILocalLangRepository>(),
      getIt<IProductRepository>(),
    ),
  );

  getIt.unregister<SearchScreenBloc>();
  getIt.registerFactoryParam<SearchScreenBloc, SearchFilter, void>(
        (filter, _) => SearchScreenBloc(getIt<SearchProductUseCase>(),filter,),
  );

  getIt.unregister<FilterScreenBloc>();
  getIt.registerFactoryParam<FilterScreenBloc, SearchFilter, void>(
        (filter, _) => FilterScreenBloc(getIt<ICategoryRepository>(),filter,),
  );
}
