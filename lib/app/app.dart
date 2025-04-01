import 'package:flutter/material.dart';
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
      theme: ThemeData(
          fontFamily: 'Neometric',
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  backgroundColor: const Color.fromRGBO(16, 53, 91, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  )))),
      routerConfig: appRouter.config(),
    );
  }
}