import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/app/app.dart';
import 'package:project_z/core/bloc/profile/profile_bloc.dart';

import 'core/bloc/auth/auth_bloc.dart';
import 'core/di/di.dart';
import 'core/network/api/api_service.dart';
import 'core/network/api/mock_api_service.dart';

void configureTestDependencies() {
  getIt.unregister<ApiService>();
  getIt.registerSingleton<ApiService>(MockApiService());
}

void main() {
  configureDependencies();
  configureTestDependencies();

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
        MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => getIt<ProfileBloc>()
              ),
              BlocProvider(
                  create: (context) => getIt<AuthBloc>()
              )
            ],
            child: MyApp(),
        )
    );
  });
}
