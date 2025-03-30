// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/repositories/profile_repository.dart' as _i971;
import '../../features/home/presentation/bloc/home_screen_bloc.dart' as _i413;
import '../../features/product/presentation/bloc/product_screen_bloc.dart'
    as _i406;
import '../../features/profile/presentation/bloc/profile_screen_bloc.dart'
    as _i812;
import '../../features/search/presentation/bloc/search_filter.dart' as _i943;
import '../../features/search/presentation/bloc/search_screen_bloc.dart'
    as _i253;
import '../bloc/auth/auth_bloc.dart' as _i79;
import '../bloc/categories/categories_bloc.dart' as _i882;
import '../bloc/news/news_bloc.dart' as _i344;
import '../bloc/products/products_bloc.dart' as _i369;
import '../bloc/profile/profile_bloc.dart' as _i481;
import '../bloc/search/search_bloc.dart' as _i835;
import '../domain/repositories/profile_repository.dart' as _i217;
import '../network/api/api_service.dart' as _i630;
import '../network/api/mock_api_service.dart' as _i235;
import 'di.dart' as _i913;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i235.MockApiService>(() => _i235.MockApiService());
  gh.singleton<_i361.Dio>(() => appModule.dio);
  gh.singleton<_i630.ApiService>(() => appModule.apiService);
  gh.factory<_i882.CategoriesBloc>(
      () => _i882.CategoriesBloc(gh<_i630.ApiService>()));
  gh.factory<_i344.NewsBloc>(() => _i344.NewsBloc(gh<_i630.ApiService>()));
  gh.factory<_i369.ProductsBloc>(
      () => _i369.ProductsBloc(gh<_i630.ApiService>()));
  gh.factory<_i79.AuthBloc>(() => _i79.AuthBloc(gh<_i630.ApiService>()));
  gh.singleton<_i217.IProfileRepository>(() => _i971.ProfileRepository());
  gh.factory<_i835.SearchBloc>(() => _i835.SearchBloc(
        gh<_i369.ProductsBloc>(),
        gh<_i882.CategoriesBloc>(),
      ));
  gh.factory<_i253.SearchScreenBloc>(() => _i253.SearchScreenBloc(
        gh<_i835.SearchBloc>(),
        initFilter: gh<_i943.SearchFilter>(),
      ));
  gh.factory<_i481.ProfileBloc>(
      () => _i481.ProfileBloc(gh<_i217.IProfileRepository>()));
  gh.factory<_i406.ProductScreenBloc>(() => _i406.ProductScreenBloc(
        gh<int>(),
        gh<_i835.SearchBloc>(),
      ));
  gh.factory<_i413.HomeScreenBloc>(() => _i413.HomeScreenBloc(
        gh<_i835.SearchBloc>(),
        gh<_i344.NewsBloc>(),
      ));
  gh.factory<_i812.ProfileScreenBloc>(
      () => _i812.ProfileScreenBloc(gh<_i481.ProfileBloc>()));
  return getIt;
}

class _$AppModule extends _i913.AppModule {}
