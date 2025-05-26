import 'package:flutter/material.dart';
import 'package:project_z/config/theme/theme.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_z/l10n/app_localizations.dart';

late AppRouter appRouter;

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _currentLocale = const Locale('ru');

  void restartApp(){
    setState((){});
  }

  void changeLanguage(Locale newLocale) {
    setState(() {
      _currentLocale = newLocale;
    });
  }


  @override
  Widget build(BuildContext context) {
    appRouter = AppRouter();
    return MaterialApp.router(
      locale: _currentLocale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru'),
        Locale('uz'),
      ],

      theme: onlineShopTheme,
      routerConfig: appRouter.config(),
    );
  }
}

class RestartAppFunction{
  static void body(BuildContext context){
    final myAppState = context.findAncestorStateOfType<_MyAppState>();
    if (myAppState != null) {
      myAppState.restartApp();
    }
  }
}

class ChangeLocalizationFunction{
  static Future<void> body(BuildContext context, Localization l) async {
    final myAppState = context.findAncestorStateOfType<_MyAppState>();
    if (myAppState != null) {
      myAppState.changeLanguage(Locale(l.name));
    }
  }
}

enum Localization{
  ru,
  uz
}