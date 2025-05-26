import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/features/orders/presentation/bloc/order_screen_bloc.dart';
import 'package:project_z/features/orders/presentation/widgets/widgets.dart';
import 'package:project_z/features/shell_widget/presentation/bloc/shell_screen_bloc.dart';
import 'package:project_z/l10n/app_localizations.dart';
import 'package:project_z/shared/auth/un_auth_placeholder.dart';
import 'package:project_z/shared/consts/colors.dart';
import 'package:project_z/shared/consts/text_style_title.dart';

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
                color: mainColor,
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
                            child: Text(AppLocalizations.of(context)!.ordersTitle, style: titleTextStyle),
                          ),
                        ),
                        BlocBuilder<OrderScreenBloc, OrderScreenState>(
                            builder: (context, state) => state.map(
                                needAuth: (d) =>
                                    const Padding(padding: EdgeInsets.only(top: 65.0), child: UnAuthPlaceholder()),
                                loading: (d) => const SizedBox(
                                    width: double.infinity,
                                    height: 200,
                                    child: Center(
                                        child: CircularProgressIndicator(
                                      color: mainColor,
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
