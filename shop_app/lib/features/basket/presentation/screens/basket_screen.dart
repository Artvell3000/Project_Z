import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/config/theme/text_styles_extension.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/basket/presentation/bloc/basket_screen_bloc.dart';
import 'package:project_z/features/basket/presentation/widgets/widgets.dart';
import 'package:project_z/features/shell_widget/presentation/bloc/shell_screen_bloc.dart';
import 'package:project_z/gen_locales/app_localizations.dart';
import 'package:project_z/shared/auth/un_auth_placeholder.dart';
import 'package:project_z/shared/functions/show_alert_dialog/show_auth_alert_dialog_function.dart';
import 'package:project_z/shared/widgets/quantity_widget.dart';
import 'package:shop_domain/domain/entity/basket/basket.dart';

@RoutePage()
class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  final showAuthDialog = ShowAuthAlertDialogFunction();

  @override
  Widget build(BuildContext context) {
    final S = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final textStyles = theme.extension<AppTextStyles>();

    return Scaffold(
        backgroundColor: const Color.fromRGBO(245,245,247,1),
        body: BlocProvider(
          create: (context) => getIt<BasketScreenBloc>(),
          child: BlocListener<ShellScreenBloc, ShellScreenState>(
            listener: (context, state) {
              state.mapOrNull(
                updated: (d){
                  if(d.isUpdatedBasket){
                    final bloc = BlocProvider.of<BasketScreenBloc>(context);
                    bloc.add(const BasketScreenEvent.refresh());
                  }
                }
              );
            },
            child: BlocListener<BasketScreenBloc, BasketScreenState>(
              listener: (context, state) async {
                await state.mapOrNull(
                    needAuth: (d) async {
                      final result = await showAuthDialog(context);
                      if (context.mounted && result != null && result) {
                        AutoRouter.of(context).push(const AuthShellRoute());
                      }
                    },
                    loaded: (d) async {
                      final bloc = BlocProvider.of<ShellScreenBloc>(context);
                      bloc.add(ShellScreenEvent.updateBasket(d.basket));
                    },
                    loadedEmpty: (d) async {
                      final bloc = BlocProvider.of<ShellScreenBloc>(context);
                      bloc.add(const ShellScreenEvent.updateBasket([]));
                    }
                );
              },
              child: Builder(
                  builder: (context) {
                    return RefreshIndicator(
                      color: theme.colorScheme.primary,
                      backgroundColor: Colors.white,
                      onRefresh: () async {
                        final bloc = BlocProvider.of<BasketScreenBloc>(context);
                        bloc.add(const BasketScreenEvent.refresh());
                        await bloc.stream.first;
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0, bottom: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      S.basketTitle,
                                      style: textStyles!.heading,
                                    ),
                                    BlocBuilder<BasketScreenBloc, BasketScreenState>(
                                      builder: (context, state) {
                                        return state.mapOrNull(loaded: (d) => QuantityWidget(d.basket.countProducts())) ??
                                            const SizedBox();
                                      },
                                    )
                                  ],
                                ),
                              ),
                              BlocBuilder<BasketScreenBloc, BasketScreenState>(builder: (context, state) {
                                return state.mapOrNull(
                                  needAuth: (d) =>
                                  const Padding(padding: EdgeInsets.only(top: 60.0), child: UnAuthPlaceholder()),
                                  loaded: (d) {
                                    final items = d.basket;
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return BasketItemWidget(
                                          key: ValueKey('${items[index].id} ${items[index].amount}'),
                                          item: items[index],
                                        );
                                      },
                                      itemCount: items.length,
                                    );
                                  },
                                  loadedEmpty: (d) => const EmptyBasketImage(),
                                  loading: (d) {
                                    return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: 2,
                                        itemBuilder: (context, index) {
                                          return const LoadingBasketItemWidget();
                                        });
                                  },
                                  error: (d) {
                                    return Center(
                                      child: Text(d.e.toString()),
                                    );
                                  },
                                ) ??
                                    const SizedBox();
                              }),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),
          ),
        ));
  }
}
