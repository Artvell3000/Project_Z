import 'package:flutter/material.dart';
import 'package:project_z/config/theme/theme.dart';
import 'package:project_z/core/routing/router.dart';

late AppRouter appRouter;

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    appRouter = AppRouter();
    return MaterialApp.router(
      theme: onlineShopTheme,
      routerConfig: appRouter.config(),
    );
  }
}