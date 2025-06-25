import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/shell_widget/presentation/bloc/shell_screen_bloc.dart';
import 'package:project_z/features/shell_widget/presentation/screens/tabs/tabs.dart';
import 'package:project_z/features/shell_widget/presentation/widgets/widgets.dart';
import 'package:project_z/features/shell_widget/presentation/widgets/app_bar/presentation/widget/app_bar.dart';
import 'package:project_z/shared/functions/show_alert_dialog/show_auth_alert_dialog_function.dart';
import 'package:project_z/shared/functions/show_alert_dialog/show_create_order_alert_dialog.dart';

@RoutePage()
class ProjectZShellScreen extends StatefulWidget {
  const ProjectZShellScreen({super.key});

  @override
  State<ProjectZShellScreen> createState() => _ProjectZShellScreenState();
}

class _ProjectZShellScreenState extends State<ProjectZShellScreen> {

  final showAuthDialod = ShowAuthAlertDialogFunction();
  final showCreateOrderDialog = ShowCreateOrderAlertDialogFunction();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ShellScreenBloc>(),
      child: BlocListener<ShellScreenBloc, ShellScreenState>(
        listener: (context, state) async {
          await state.mapOrNull(
            needAuth: (d) async {
              showAuthDialod(context).then((response){
                if(response!=null && response && context.mounted){
                  AutoRouter.of(context).push(const AuthShellRoute());
                }
              });
            },
            updated: (d) async {
              if(d.isTryingCreateOrder){
                final bloc = BlocProvider.of<ShellScreenBloc>(context);
                final bool? response = await showCreateOrderDialog(context, bloc.basketItems);
                if(response!=null && response){
                  bloc.add(const ShellScreenEvent.createOrder());
                }
              }
          }
          );

        },
        child: AutoTabsScaffold(
          appBarBuilder: (context, tabRouter) {
            return const ShopAppBar();
          },
          transitionBuilder: (context, child, _) {
            return child;
          },
          routes: const [
            HomeTabRoute(),
            SearchTabRoute(),
            BasketTabRoute(),
            OrdersTabRoute(),
            ProfileTabRoute(),
          ],
          bottomNavigationBuilder: (_, tabsRouter) {
            return CustomBottomBar(
              onDoubleTap: (index){
                // перезагрузка вкладки
            switch (index) {
              case 0: // Домашняя вкладка
                homeTabKey.currentState?.resetTab();
                break;
              case 1: // Поиск
                searchTabKey.currentState?.resetTab();
                break;
              case 2: // Корзина
                basketTabKey.currentState?.resetTab();
                break;
              case 3: // Заказы
                ordersTabKey.currentState?.resetTab();
                break;
              case 4: // Профиль
                profileTabKey.currentState?.resetTab();
                break;
              }},
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
              },
              currentIndex: tabsRouter.activeIndex,
            );
          },
        ),
      ),
    );
  }
}


