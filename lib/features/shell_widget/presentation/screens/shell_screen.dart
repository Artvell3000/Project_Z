import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/search/domain/entity/search_filter.dart';
import 'package:project_z/features/shell_widget/presentation/bloc/shell_screen_bloc.dart';
import 'package:project_z/features/shell_widget/presentation/widgets/widgets.dart';
import 'package:project_z/shared/app_bar/app_bar_builder.dart';
import 'package:project_z/shared/functions/show_alert_dialog/show_auth_alert_dialog_function.dart';

@RoutePage()
class ProjectZShellScreen extends StatefulWidget {
  const ProjectZShellScreen({super.key});

  @override
  State<ProjectZShellScreen> createState() => _ProjectZShellScreenState();
}

class _ProjectZShellScreenState extends State<ProjectZShellScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ShellScreenBloc>(),
      child: BlocListener<ShellScreenBloc, ShellScreenState>(
        listenWhen: (_, state) => state.maybeMap(orElse: () => false, needAuth: (d) => true),
        listener: (context, state){
          ShowAuthAlertDialogFunction.body(context).then((response){
            if(response!=null && response && context.mounted){
              AutoRouter.of(context).push(const AuthenticationSendCodeRoute());
            }
          });
        },
        child: AutoTabsScaffold(
          appBarBuilder: (context, tabRouter) {
            return const ShopAppBar();
          },
          transitionBuilder: (context, child, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: child,
            );
          },
          routes: [
            const HomeRoute(),
            SearchRoute(initFilter: SearchFilter.empty),
            BasketRoute(count: 0),
            const OrderListRoute(),
            const ProfileRoute(),
            
            ProductRoute(productId: -1)
          ],
          bottomNavigationBuilder: (_, tabsRouter) {
            if(!getIt.isRegistered<TabsRouter>()){
              getIt.registerSingleton<TabsRouter>(tabsRouter);
            }

            return CustomBottomBar(
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


