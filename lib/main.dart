import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/app/app.dart';
import 'package:project_z/core/bloc/buy_flow_facade/buy_flow_facade_bloc.dart';
import 'package:project_z/features/basket/presentation/bloc/basket_screen_bloc.dart';
import 'core/di/di.dart';
import 'core/network/api/mock/mock_api_service.dart';
import 'core/network/api/service/api_service.dart';
import 'features/shell_widget/presentation/bloc/auth/auth_screen_bloc.dart';

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
          create: (context) => getIt<BuyFlowFacadeBloc>(),
          child: BlocProvider(
            create: (context) => BasketScreenBloc(),
            child: BlocProvider(
              create: (context) => getIt<AuthScreenBloc>(),
              child: MyApp(),
            ),
          ),
        )
    );
  });
}
