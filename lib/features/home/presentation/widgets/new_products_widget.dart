import 'package:flutter/material.dart';
import 'package:project_z/features/home/presentation/widgets/products_with_status_preview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewProductsWidget extends StatelessWidget {
  const NewProductsWidget({super.key, required this.onTapMoreNewProducts});

  final void Function() onTapMoreNewProducts;

  @override
  Widget build(BuildContext context) {
    return ProductsWithStatusPreview(
      onTapMoreProducts: onTapMoreNewProducts,
      title: AppLocalizations.of(context)!.homeNewProductsTitle,
      status: 'yangilik',
    );
  }
}
