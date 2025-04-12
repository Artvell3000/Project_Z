import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:project_z/features/basket/presentation/widgets/widgets.dart';
import 'package:project_z/features/product/presentation/widgets/widgets.dart';
import 'package:project_z/shared/consts/text_style_title.dart';
import 'package:project_z/shared/scaffolds/z_scaffold.dart';
import 'package:project_z/shared/widgets/quantity_widget.dart';

@RoutePage()
class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ZScaffold(
      padding: EdgeInsets.symmetric(horizontal: 10),
      children: [
        Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: FastNavigation(),
        ),
        Padding(
            padding: EdgeInsets.only(top: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mening savatcham', style: titleTextStyle,),
              QuantityWidget(quantity: 12)
            ],
          ),
        ),
        BasketItemWidget(),
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: PaymentCard(),
        ),
      ],
    );
  }
}
