import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_z/app/app.dart';
import 'core/di/di.dart';
import 'core/network/api/mock/mock_api_service.dart';
import 'core/network/api/service/api_service.dart';

void configureTestDependencies() {
  getIt.unregister<ApiService>();
  getIt.registerSingleton<ApiService>(MockApiService());
}

void main() {
  configureDependencies();

  //MOCK
  configureTestDependencies();
  //MOCK

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
        MyApp()
    );
  });
}
