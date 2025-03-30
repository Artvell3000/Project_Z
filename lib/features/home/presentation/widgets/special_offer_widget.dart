import 'package:flutter/material.dart';
import 'package:project_z/features/home/presentation/widgets/products_with_status_preview.dart';

class SpecialOffersWidget extends StatelessWidget {
  const SpecialOffersWidget({super.key, required this.onTapMoreSpecialOffers});

  final void Function() onTapMoreSpecialOffers;

  @override
  Widget build(BuildContext context) {
    return ProductsWithStatusPreview(
        onTapMoreProducts: onTapMoreSpecialOffers,
        title: 'Mahsus taklif.',
        status: 'mahsus_taklif',
    );
  }
}