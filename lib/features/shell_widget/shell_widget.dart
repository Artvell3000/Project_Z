import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/shell_widget/under_app_bar_widget.dart';
import 'package:project_z/flutter_app_icons.dart';
import 'package:project_z/shared/app_bar/app_bar_builder.dart' as shared;

@RoutePage()
class ProjectZShellScreen extends StatelessWidget {
  const ProjectZShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (context, tab){
        return shared.AppBarBuilder.build();
      },

      transitionBuilder: (context, child, _){
        return Column(
          children: [
            const UnderAppBarWidget(),
            Expanded(child: child)
          ],
        );
      },

      routes: [
        const HomeRoute(),
        SearchRoute(),
        const BasketRoute(),
        ProfileRoute(),
      ],

      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(

          showUnselectedLabels : true,
          currentIndex: tabsRouter.activeIndex,
          unselectedItemColor: const Color.fromRGBO(150, 155, 159, 1),
          selectedItemColor: const Color.fromRGBO(16, 53, 91, 1),
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(label: 'home', icon: Icon(CustomIcons.home),),
            BottomNavigationBarItem(label: 'search', icon: Icon(CustomIcons.search),),
            BottomNavigationBarItem(label: 'basket', icon: Icon(CustomIcons.basket),),
            BottomNavigationBarItem(label: 'profile', icon: Icon(CustomIcons.profile),),
          ],
        );
      },

    );
  }
}