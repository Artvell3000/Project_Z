import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyBasketImage extends StatelessWidget {
  const EmptyBasketImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Center(child: SvgPicture.asset('assets/basket/empty_basket.svg')),
    );
  }
}
