import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/features/basket/presentation/bloc/basket_screen_bloc.dart';
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
        BlocBuilder<BasketScreenBloc,BasketScreenState>(
            builder: (context, state){
              return state.mapOrNull(
                loaded: (d){
                  if(d.amount == 0) return EmptyBasketImage();
                   return Column(
                     children: [
                       Padding(
                         padding: EdgeInsets.only(top: 30.0, bottom: 20),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('Mening savatcham', style: titleTextStyle,),
                             QuantityWidget(quantity: 3)
                           ],
                         ),
                       ),
                       Column(
                         children: [
                           BasketItemWidget(),
                           //BasketItemWidget()
                         ],
                       ),
                       Padding(
                         padding: EdgeInsets.only(top: 5.0),
                         child: PaymentCard(),
                       ),
                     ],
                   );
                }
              ) ?? SizedBox();
            }
        )
      ],
    );
  }
}
