import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project_z/core/routing/router.dart';

@RoutePage()
class ZEmptyShellScreen extends StatelessWidget {
  const ZEmptyShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoTabsRouter(
        routes: [
          const HomeRoute(),
          SearchRoute(),
          const BasketRoute(),
          ProfileRoute(),
          ProductRoute(productId: 3)
        ],
        builder: (context, child) => child,
      ),
    );
  }
}


// class ProjectZShellScreen extends StatefulWidget {
//   const ProjectZShellScreen({super.key});
//
//   @override
//   State<ProjectZShellScreen> createState() => _ProjectZShellScreenState();
// }
//
// class _ProjectZShellScreenState extends State<ProjectZShellScreen> {
//   int _currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: shared.AppBarBuilder.build(),
//       body: Column(
//         children: [
//           const UnderAppBarWidget(),
//           Expanded(
//             child: AutoTabsRouter(
//               routes: [
//                 const HomeRoute(),
//                 const SearchRoute(),
//                 const BasketRoute(),
//                 ProfileRoute(),
//
//
//                 ProductRoute(tags: [], productId: 3)
//               ],
//               builder: (context, child) {
//                 return child;
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: _buildBottomNavBar(context),
//     );
//   }
//
//   Widget _buildBottomNavBar(BuildContext context) {
//     return BottomNavigationBar(
//       showUnselectedLabels: true,
//       currentIndex: _currentIndex,
//       unselectedItemColor: const Color.fromRGBO(150, 155, 159, 1),
//       selectedItemColor: const Color.fromRGBO(16, 53, 91, 1),
//       onTap: (index) {
//         //Logger().i('[Stack] ${AutoRouter.of(context).stack}');
//         setState(() {
//           if(index == _currentIndex) return;
//           _currentIndex = index;
//           switch(index){
//             case 0: {
//               AutoRouter.of(context).push(const HomeRoute());
//             }
//             case 1: {
//               AutoRouter.of(context).push(const SearchRoute());
//             }
//             case 2: {
//               AutoRouter.of(context).push(const BasketRoute());
//             }
//             case 3: {
//               AutoRouter.of(context).push(ProfileRoute());
//             }
//           }
//         });
//       },
//       items: const [
//         BottomNavigationBarItem(
//           label: 'home',
//           icon: Icon(CustomIcons.home),
//         ),
//         BottomNavigationBarItem(
//           label: 'search',
//           icon: Icon(CustomIcons.search),
//         ),
//         BottomNavigationBarItem(
//           label: 'basket',
//           icon: Icon(CustomIcons.basket),
//         ),
//         BottomNavigationBarItem(
//           label: 'profile',
//           icon: Icon(CustomIcons.profile),
//         ),
//       ],
//     );
//   }
// }
