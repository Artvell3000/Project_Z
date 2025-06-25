import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_z/app/app.dart';
import 'package:shop_domain/domain/config/currency_config.dart';
import 'package:shop_hive/datasource/search_history/entity/search_history/search_history.dart';
import 'core/di/di.dart';
import 'features/shell_widget/presentation/bloc/shell_screen_bloc.dart';

void main() async {

  // Инициализация di
  await configureDependencies();

  WidgetsFlutterBinding.ensureInitialized();

  initializeCurrency();

  // Инициализация Hive
  await Hive.initFlutter();
  Hive.registerAdapter(HiveSearchHistoryItemAdapter());
  //getIt<ITokenRepository>().clear();
  // Отключение автоповорота
   await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
      MultiBlocProvider(providers: [
        BlocProvider(create: (_) => getIt<ShellScreenBloc>()),
      ],
          child:  const MyApp())
  );
}
