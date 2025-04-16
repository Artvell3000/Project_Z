import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project_z/features/features.dart';
import 'package:project_z/features/search/domain/entity/search_filter.dart';
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
        AutoRoute(path: 'orders', page: OrderListRoute.page),
        AutoRoute(path: 'home', page: HomeRoute.page),
        AutoRoute(path: 'product', page: ProductRoute.page), // Assuming Product is a top-level tab
        AutoRoute(path: 'search', page: SearchRoute.page),
        AutoRoute(path: 'basket', page: BasketRoute.page),
        AutoRoute(path: 'profile', page: ProfileRoute.page),
        AutoRoute(path: 'menu', page: MenuRoute.page),
      ],
    ),
  ];
}