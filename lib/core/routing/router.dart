import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project_z/features/authentication/presentation/screens/authentication_send_code_screen.dart';
import 'package:project_z/features/authentication/presentation/screens/authentication_verify_code_screen.dart';
import 'package:project_z/features/features.dart';
import 'package:project_z/features/search/domain/entity/search_filter.dart';
part 'router.gr.dart';



@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.custom(
    transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
    durationInMilliseconds: 0,
    reverseDurationInMilliseconds: 0,
  );

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/',
      page: ProjectZShellRoute.page,
      initial: true,
      children: [
        AutoRoute(path: 'home', page: HomeRoute.page),
        AutoRoute(path: 'search/:initFilter', page: SearchRoute.page, children: [
          AutoRoute(path: 'search/:initFilter', page: SearchRoute.page),
        ]),
        AutoRoute(path: 'basket/:count', page: BasketRoute.page),
        AutoRoute(path: 'orders', page: OrderListRoute.page),
        AutoRoute(path: 'profile', page: ProfileRoute.page),
        AutoRoute(path: 'product/:productId', page: ProductRoute.page),
      ],
    ),

    AutoRoute(path: '/auth/send-code', page: AuthenticationSendCodeRoute.page),
    CustomRoute(
        path: '/auth/verify-code',
        page: AuthenticationVerifyCodeRoute.page,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      durationInMilliseconds: 500,
      reverseDurationInMilliseconds: 500,
    )
  ];
}