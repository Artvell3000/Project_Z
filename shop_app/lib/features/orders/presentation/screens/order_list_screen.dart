import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/config/theme/text_styles_extension.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/features/orders/presentation/bloc/order_screen_bloc.dart';
import 'package:project_z/features/orders/presentation/widgets/widgets.dart';
import 'package:project_z/features/shell_widget/presentation/bloc/shell_screen_bloc.dart';
import 'package:project_z/gen_locales/app_localizations.dart';
import 'package:project_z/shared/auth/un_auth_placeholder.dart';

@RoutePage()
class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final textStyles = theme.extension<AppTextStyles>();
    final S = AppLocalizations.of(context);


    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<OrderScreenBloc>(),
        child: BlocListener<ShellScreenBloc, ShellScreenState>(
          listener: (context, state) {
            state.mapOrNull(
              updated: (d){
                if(d.isUpdatedOrders){
                  final bloc = BlocProvider.of<OrderScreenBloc>(context);
                  bloc.add(const OrderScreenEvent.refresh());
                }
              }
            );
          },
          child: Builder(
            builder: (context) {
              return RefreshIndicator(
                onRefresh: () async {
                  final bloc = BlocProvider.of<OrderScreenBloc>(context);
                  bloc.add(const OrderScreenEvent.refresh());
                  await bloc.stream.first;
                },
                color: scheme.primary,
                backgroundColor: Colors.white,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: _scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30.0, bottom: 15),
                            child: Text(S.ordersTitle, style: textStyles!.heading),
                          ),
                        ),
                        BlocBuilder<OrderScreenBloc, OrderScreenState>(
                            builder: (context, state) => state.map(
                                needAuth: (d) =>
                                    const Padding(padding: EdgeInsets.only(top: 65.0), child: UnAuthPlaceholder()),
                                loading: (d) => SizedBox(
                                    width: double.infinity,
                                    height: 200,
                                    child: Center(
                                        child: CircularProgressIndicator(
                                      color: scheme.primary,
                                    ))),
                                loaded: (d) => ListView.separated(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: d.items.length,
                                      separatorBuilder: (BuildContext context, int index) {
                                        return const SizedBox(height: 10.0);
                                      },
                                      itemBuilder: (BuildContext context, int index) {
                                        return OrderInfoContainer(info: d.items[index]);
                                      },
                                    ),
                                error: (d) => Center(
                                      child: Text(d.e.toString()),
                                    )))
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
