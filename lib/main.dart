import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/app/app.dart';
import 'core/di/di.dart';
import 'core/network/api/mock/mock_api_service.dart';
import 'core/network/api/service/api_service.dart';
import 'features/shell_widget/presentation/bloc/auth/auth_bloc.dart';

void configureTestDependencies() {
  getIt.unregister<ApiService>();
  getIt.registerSingleton<ApiService>(MockApiService());
}

void main() {
  configureDependencies();

  //MOCK
  //configureTestDependencies();
  //MOCK

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
        BlocProvider(
          create: (context) => getIt<AuthBloc>(),
          child: MyApp(),
        )
    );
  });
}
