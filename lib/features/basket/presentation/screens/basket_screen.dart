import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/features/basket/presentation/bloc/basket_screen_bloc.dart';
import 'package:project_z/features/basket/presentation/widgets/widgets.dart';
import 'package:project_z/features/product/presentation/widgets/widgets.dart';
import 'package:project_z/shared/consts/text_style_title.dart';
import 'package:project_z/shared/scaffolds/z_scaffold.dart';
import 'package:project_z/shared/widgets/quantity_widget.dart';

@RoutePage()
class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}


class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return ZScaffold(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: FastNavigation(),
        ),
        BlocProvider(
          create: (context) => getIt<BasketScreenBloc>(),
          child: BlocBuilder<BasketScreenBloc, BasketScreenState>(
              builder: (context, state) {
                return state.map(
                  loaded: (d) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0, bottom: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Mening savatcham', style: titleTextStyle,),
                              QuantityWidget(quantity: d.amount)
                            ],
                          ),
                        ),
                        Column(
                          children: d.items.entries.map((el) {
                            return Column(
                              children: el.value.map((item) {
                                return BasketItemWidget(item: item,);
                              }).toList(),
                            );
                          }).toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: PaymentCard(
                            categoryPrice: d.categoryPrice,
                            fullPrice: d.fullPrice,
                            fullPriceWithDiscount: d.fullPriceWithDiscount,
                          ),
                        ),
                      ],
                    );
                  },
                  loadedEmpty: (d) => const EmptyBasketImage(),
                  loading: (d) =>
                  const SizedBox(
                      width: double.infinity, height: 200, child: Center(child: CircularProgressIndicator())),
                  error: (d) {
                    return Center(child: Text(d.message),);
                  },
                  changeSelect: (d) => const SizedBox(),
                  checkoutError: (d) => const SizedBox(),
                );
              }
          ),
        )
      ],
    );
  }
}
