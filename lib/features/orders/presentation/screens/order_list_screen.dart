import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/features/orders/presentation/bloc/order_screen_bloc.dart';
import 'package:project_z/features/orders/presentation/widgets/widgets.dart';
import 'package:project_z/shared/consts/text_style_title.dart';
import 'package:project_z/shared/scaffolds/z_scaffold.dart';
import 'package:project_z/shared/widgets/fast_navigation.dart';

@RoutePage()
class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrderScreenBloc>(),
      child: ZScaffold(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: FastNavigation(),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 30.0, bottom: 15),
              child: Text('Mening sahifam', style: titleTextStyle),
            ),
          ),
          BlocBuilder<OrderScreenBloc, OrderScreenState>(
            builder: (context, state) {

              return state.map(
                  loading: (d) => const SizedBox(
                      width: double.infinity, height: 200, child: Center(child: CircularProgressIndicator())),
                  loaded: (d) => Column(
                    children: d.items.map((el){
                      return OrderInfoContainer(info: el);
                    }).toList(),
                  ),
                  loadedEmpty: (d) => const SizedBox(),
                  error: (d) => Center(child: Text(d.message),)
              );
              // Logger().i('$state');
              // return OrderInfoContainer();
            },
          )
        ],
      ),
    );
  }
}
