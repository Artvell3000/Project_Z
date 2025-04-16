import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:project_z/core/bloc/buy_flow_facade/buy_flow_facade_bloc.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/basket/presentation/bloc/basket_screen_bloc.dart';
import 'package:project_z/features/shell_widget/presentation/bloc/auth/auth_screen_bloc.dart';
import 'package:project_z/features/shell_widget/presentation/widgets/widgets.dart';
import 'package:project_z/flutter_app_icons.dart';
import 'package:project_z/shared/app_bar/app_bar_builder.dart' as shared;

const loadingWidget = SizedBox(
  width: 320,
  height: 320,
  child: Center(child: SizedBox(height: 60, width: 60, child: CircularProgressIndicator())),
);

@RoutePage()
class ProjectZShellScreen extends StatefulWidget {
  const ProjectZShellScreen({super.key});

  @override
  State<ProjectZShellScreen> createState() => _ProjectZShellScreenState();
}

class _ProjectZShellScreenState extends State<ProjectZShellScreen> {

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (context, tab) {
        return shared.AppBarBuilder.build();
      },
      transitionBuilder: (context, child, _) {
        return BlocBuilder<AuthScreenBloc, AuthScreenState>(
          builder: (context, state) {
            return Stack(
              children: [
                Column(
                  children: [const UnderAppBarWidget(), Expanded(child: child)],
                ),
                state.when(
                  hide: () => const SizedBox(),
                  inputData: (fullUsername, username) =>
                      AuthShell(
                        child: AuthAddDataWidget(
                          initFullName: fullUsername ?? '',
                          initPhone: username ?? '',
                          onClickButtonWhenEnteredData: (fullName, phone) {
                            BlocProvider.of<AuthScreenBloc>(context).add(AuthScreenEvent.sendCode(phone));
                          },
                        ),
                      ),
                  sendingCode: () => const AuthShell(child: loadingWidget),
                  verifyingCode: () => const AuthShell(child: loadingWidget),
                  inputCode: (username) =>
                      AuthShell(child: AuthVerifyCodeWidget(
                        onClickSendWhenEnteredCode: (code) {
                          BlocProvider.of<AuthScreenBloc>(context).add(AuthScreenEvent.verifyCode(username, code));
                        },
                      )),
                  unsuccessVerifyCode: (username) => const SizedBox(),
                  loaded: (user) => const SizedBox(),
                  notLoaded: () => const SizedBox(),
                  loading: () => const SizedBox(),
                  error: (message) => AuthShell(child: Center(child: Text(message))),
                ),
              ],
            );
          },
          buildWhen: (_, state) {
            return state.mapOrNull(unsuccessVerifyCode: (d) => false) ?? true;
          },
        );
      },
      routes: [

        const HomeRoute(),
        SearchRoute(),
        const BasketRoute(),
        const ProfileRoute(),

        const OrderListRoute(),
        const MenuRoute(),
        ProductRoute(productId: 1),

      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return CustomBottomBar(
          onTap: tabsRouter.setActiveIndex,
          currentIndex: tabsRouter.activeIndex,
        );
      },
    );
  }
}

class CustomBottomBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBarItem(context, 0, CustomIcons.home, 'Home'),
          _buildBarItem(context, 1, CustomIcons.search, 'Search'),
          _buildBarItem(context, 2, CustomIcons.basket, 'Basket', isBasket: true, onClick: (){
            BlocProvider.of<BuyFlowFacadeBloc>(context).add(
                const BuyFlowFacadeEvent.requestBasket()
            );
          }),
          _buildBarItem(context, 3, CustomIcons.profile, 'Profile', onClick: (){
            BlocProvider.of<BuyFlowFacadeBloc>(context).add(
                const BuyFlowFacadeEvent.requestUser()
            );
          }),
        ],
      ),
    );
  }

  Widget _buildBarItem(BuildContext context,int index, IconData icon, String label, {
    bool isBasket = false,
    void Function()? onClick,
  }) {
    final isSelected = widget.currentIndex == index;
    return GestureDetector(
      onTap: () {
          widget.onTap(index);
          if(onClick != null) onClick();
        },
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? const Color.fromRGBO(16, 53, 91, 1) : const Color.fromRGBO(150, 155, 159, 1),
              ),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? const Color.fromRGBO(16, 53, 91, 1) : const Color.fromRGBO(150, 155, 159, 1),
                ),
              ),
            ],
          ),
          (isBasket) ? FractionalTranslation(
            translation: const Offset(1.2, 0.05),
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15), // Adjust the radius for desired roundness
              ),
              child: Center(
                child: Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15), // Adjust the radius for desired roundness
                  ),
                  child: const Center(
                    child: FractionalTranslation(
                      translation: Offset(0.0, 0.05),
                      child: Text('3', style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13
                      ),),
                    ),
                  ),
                ),
              ),
            ),
          ) : const SizedBox(),
        ],
      ),
    );
  }
}


