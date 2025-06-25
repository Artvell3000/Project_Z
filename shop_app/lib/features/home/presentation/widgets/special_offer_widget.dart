import 'package:flutter/material.dart';
import 'package:project_z/features/home/presentation/widgets/products_with_status_preview.dart';
import 'package:project_z/gen_locales/app_localizations.dart';

class SpecialOffersWidget extends StatelessWidget {
  const SpecialOffersWidget({super.key, required this.onTapMoreSpecialOffers});

  final void Function() onTapMoreSpecialOffers;

  @override
  Widget build(BuildContext context) {
    return ProductsWithStatusPreview(
      onTapMoreProducts: onTapMoreSpecialOffers,
      title: AppLocalizations.of(context).homeSpecialOfferTitle,
      status: 'mahsus_taklif',
    );
  }
}
