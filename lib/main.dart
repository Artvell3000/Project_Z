import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_z/app/app.dart';
import 'package:project_z/core/bloc/buy_flow_facade/buy_flow_facade_bloc.dart';
import 'core/di/di.dart';
import 'core/network/api/mock/mock_api_service.dart';
import 'core/network/api/service/api_service.dart';
import 'features/shell_widget/presentation/bloc/auth/auth_screen_bloc.dart';

void configureTestDependencies() {
  getIt.unregister<ApiService>();
  getIt.registerSingleton<ApiService>(MockApiService());
}

void main() async {

  // Инициализация di
  configureDependencies();

  //MOCK
  // todo запускать из командной строки
  configureTestDependencies();
  //MOCK

  WidgetsFlutterBinding.ensureInitialized();

  // Инициализация Hive
  await Hive.initFlutter();
  await Hive.openBox('searchHistory');
  await Hive.openBox('tokens');

  // Отключение автоповорота
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      MultiBlocProvider(providers: [
        BlocProvider(create: (_) => getIt<BuyFlowFacadeBloc>()),
        BlocProvider(create: (_) => getIt<AuthScreenBloc>()),
      ],
          child:  MyApp())
    );
  });
}
