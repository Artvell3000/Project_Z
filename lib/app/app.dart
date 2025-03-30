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
          // pageTransitionsTheme: const PageTransitionsTheme(
          //   builders: {
          //     TargetPlatform.android: NoAnimationPageTransitionsBuilder(),
          //     TargetPlatform.iOS: NoAnimationPageTransitionsBuilder(),
          //   },
          // ),
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

// class NoAnimationPageTransitionsBuilder extends PageTransitionsBuilder {
//   const NoAnimationPageTransitionsBuilder();
//
//   @override
//   Widget buildTransitions<T>(
//       PageRoute<T> route,
//       BuildContext context,
//       Animation<double> animation,
//       Animation<double> secondaryAnimation,
//       Widget child,
//       ) {
//     return child; // Возвращает child без анимаций
//   }
// }