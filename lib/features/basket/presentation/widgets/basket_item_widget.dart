import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_z/core/domain/entity/basket/basket.dart';
import 'package:project_z/features/basket/presentation/bloc/basket_screen_bloc.dart';
import 'package:project_z/shared/consts/text_style_title.dart';
import 'package:project_z/shared/widgets/discount_widget.dart';

class BasketItemWidget extends StatelessWidget {
  const BasketItemWidget({super.key, required this.item});

  final BasketItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.network(
                  item.product.images.first.image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            item.product.formattedFinalPrice,
                            style: titleTextStyle,
                          ),
                          const SizedBox(width: 8.0),
                          DiscountWidget(value: item.product.discount),
                        ],
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        item.product.name,
                        style: const TextStyle(
                            fontSize: 14.0, color: Color.fromRGBO(97, 97, 97, 1), fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Mahsulot kodi: ${item.product.slug}',
                        style: const TextStyle(
                          color: Color.fromRGBO(130, 130, 130, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        //todo unselect
                      },
                      child: SvgPicture.asset(
                        'assets/basket/metka.svg',
                        height: 30,
                      )),
                  Row(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(36, 36),
                            backgroundColor: (item.amount == 1) ? Colors.grey : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.zero,
                            elevation: 0,
                          ),
                          onPressed: () {
                            if (item.amount > 1) {
                              final bloc = BlocProvider.of<BasketScreenBloc>(context);
                              bloc.add(BasketScreenEvent.decrementQuantity(item.id));
                            }
                          },
                          child: const Center(
                            child: Icon(
                              Icons.remove,
                              size: 30.0,
                              color: Colors.black,
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17.0),
                        child: Text(item.amount.toString(),
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(40, 47, 60, 1),
                            )),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(36, 36),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.zero,
                          elevation: 0,
                        ),
                        onPressed: () {
                          final bloc = BlocProvider.of<BasketScreenBloc>(context);
                          bloc.add(BasketScreenEvent.incrementQuantity(item.id));
                        },
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 30.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        final bloc = BlocProvider.of<BasketScreenBloc>(context);
                        bloc.add(BasketScreenEvent.removeItem(item.id));
                      },
                      child: SvgPicture.asset(
                        'assets/basket/basket.svg',
                        color: const Color.fromRGBO(148, 153, 165, 1),
                        height: 30,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
