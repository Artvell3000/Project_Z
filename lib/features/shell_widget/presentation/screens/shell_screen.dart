import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/shell_widget/presentation/bloc/auth/auth_bloc.dart';
import 'package:project_z/features/shell_widget/presentation/widgets/widgets.dart';
import 'package:project_z/flutter_app_icons.dart';
import 'package:project_z/shared/app_bar/app_bar_builder.dart' as shared;

const loadingWidget = SizedBox(
  width: 320,
  height: 320,
  child: Center(child: SizedBox(height: 100, width: 100, child: CircularProgressIndicator())),
);

@RoutePage()
class ProjectZShellScreen extends StatefulWidget {
  const ProjectZShellScreen({super.key});

  @override
  State<ProjectZShellScreen> createState() => _ProjectZShellScreenState();
}

class _ProjectZShellScreenState extends State<ProjectZShellScreen> {
  bool showAuth = false;

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (context, tab) {
        return shared.AppBarBuilder.build();
      },
      transitionBuilder: (context, child, _) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Stack(
              children: [
                Column(
                  children: [const UnderAppBarWidget(), Expanded(child: child)],
                ),
                state.when(
                  hide: () => const SizedBox(),
                  inputData: (fullUsername, username) => AuthShell(
                    child: AuthAddDataWidget(
                      initFullName: fullUsername ?? '',
                      initPhone: username ?? '',
                      onClickButtonWhenEnteredData: (fullName, phone) {
                        BlocProvider.of<AuthBloc>(context).add(AuthEvent.sendCode(phone));
                      },
                    ),
                  ),
                  sendingCode: () => const AuthShell(child: loadingWidget),
                  verifyingCode: () => const AuthShell(child: loadingWidget),
                  inputCode: (username) => AuthShell(child: AuthVerifyCodeWidget(
                    onClickSendWhenEnteredCode: (code) {
                      BlocProvider.of<AuthBloc>(context).add(AuthEvent.verifyCode(username, code));
                    },
                  )),
                  unsuccessVerifyCode: (username) => AuthShell(child: AuthVerifyCodeWidget(
                    onClickSendWhenEnteredCode: (code) {
                      BlocProvider.of<AuthBloc>(context).add(AuthEvent.verifyCode(username, code));
                    },
                  )),
                  loaded: (user) => const SizedBox(),
                  notLoaded: () => const SizedBox(),
                  loading: () => const SizedBox(),
                  error: (message) => AuthShell(child: Center(child: Text(message))),
                ),
              ],
            );
          },
        );
      },
      routes: [
        const HomeRoute(),
        SearchRoute(),
        const BasketRoute(),
        const ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          showUnselectedLabels: true,
          currentIndex: tabsRouter.activeIndex,
          unselectedItemColor: const Color.fromRGBO(150, 155, 159, 1),
          selectedItemColor: const Color.fromRGBO(16, 53, 91, 1),
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'home',
              icon: Icon(CustomIcons.home),
            ),
            BottomNavigationBarItem(
              label: 'search',
              icon: Icon(CustomIcons.search),
            ),
            BottomNavigationBarItem(
              label: 'basket',
              icon: Icon(CustomIcons.basket),
            ),
            BottomNavigationBarItem(
              label: 'profile',
              icon: Icon(CustomIcons.profile),
            ),
          ],
        );
      },
    );
  }
}
