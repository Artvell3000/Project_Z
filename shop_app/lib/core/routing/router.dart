import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project_z/features/authentication/presentation/screens/authentication_send_code_screen.dart';
import 'package:project_z/features/authentication/presentation/screens/authentication_verify_code_screen.dart';
import 'package:project_z/features/features.dart';
import 'package:project_z/features/shell_widget/presentation/screens/tabs/tabs.dart';
import 'package:shop_domain/domain/entity/search_filter/search_filter.dart';
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
        AutoRoute(page: HomeTabRoute.page, children: [
          AutoRoute(page: HomeRoute.page, initial: true),
          AutoRoute(page: SearchRoute.page),
          AutoRoute(page: ProductRoute.page),
        ]),
        AutoRoute(page: SearchTabRoute.page, children: [
          AutoRoute(page: SearchRoute.page, initial: true),
          AutoRoute(page: ProductRoute.page),
        ]),
        AutoRoute(page: BasketTabRoute.page, children: [
          AutoRoute(page: BasketRoute.page, initial: true),
          AutoRoute(page: ProductRoute.page),
        ]),
        AutoRoute(page: OrdersTabRoute.page, children: [
          AutoRoute(page: OrderListRoute.page, initial: true),
          AutoRoute(page: ProductRoute.page),
        ]),
        AutoRoute(page: ProfileTabRoute.page, children: [
          AutoRoute(page: ProfileRoute.page, initial: true),
        ]),
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