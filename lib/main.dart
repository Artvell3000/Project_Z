import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_z/app/app.dart';
import 'package:project_z/data/datasource/tokens/entity/hive_auth_tokens/hive_auth_tokens.dart';
import 'package:project_z/data/repositories/hive_tokens_repository.dart';
import 'core/di/di.dart';
import 'core/domain/repositories/token_repository.dart';
import 'features/shell_widget/presentation/bloc/shell_screen_bloc.dart';

void main() async {

  // Инициализация di
  configureDependencies();

  WidgetsFlutterBinding.ensureInitialized();

  // Инициализация init
  await Hive.initFlutter();
  Hive.registerAdapter(HiveAuthTokensAdapter());

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
          child:  MyApp())
  );
}
