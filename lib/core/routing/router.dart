import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project_z/features/basket/presentation/screens/basket_screen.dart';
import 'package:project_z/features/home/presentation/screens/home_screen.dart';
import 'package:project_z/features/product/presentation/screens/product_screen.dart';
import 'package:project_z/features/profile/presentation/screens/profile_screen.dart';
import 'package:project_z/features/search/presentation/bloc/search_filter.dart';
import 'package:project_z/features/search/presentation/screens/search_screen.dart';
import 'package:project_z/features/shell_widget/presentation/screens/shell_screen.dart';
import 'package:project_z/features/shell_widget/presentation/widgets/empty_shell.dart';
part 'router.gr.dart';



@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
        path: '/',
        page: ProjectZShellRoute.page,
        initial: true,
        children: [
          AutoRoute(
              page: ZEmptyShellRoute.page,
            children: [
              AutoRoute(page: HomeRoute.page, initial: true),
              AutoRoute(page: ProductRoute.page,),
              AutoRoute(page: SearchRoute.page),
              AutoRoute(page: BasketRoute.page),
              AutoRoute(page: ProfileRoute.page),
            ]
          ),

          AutoRoute(
              page: ZEmptyShellRoute.page,
              children: [
                AutoRoute(page: HomeRoute.page, ),
                AutoRoute(page: ProductRoute.page,),
                AutoRoute(page: SearchRoute.page, initial: true),
                AutoRoute(page: BasketRoute.page),
                AutoRoute(page: ProfileRoute.page),
              ]
          ),

          AutoRoute(
              page: ZEmptyShellRoute.page,
              children: [
                AutoRoute(page: HomeRoute.page),
                AutoRoute(page: ProductRoute.page,),
                AutoRoute(page: SearchRoute.page),
                AutoRoute(page: BasketRoute.page, initial: true),
                AutoRoute(page: ProfileRoute.page),
              ]
          ),

          AutoRoute(
              page: ZEmptyShellRoute.page,
              children: [
                AutoRoute(page: HomeRoute.page, ),
                AutoRoute(page: ProductRoute.page,),
                AutoRoute(page: SearchRoute.page),
                AutoRoute(page: BasketRoute.page),
                AutoRoute(page: ProfileRoute.page, initial: true),
              ]
          ),
        ]
    ),

  ];
}