import 'package:flutter/material.dart';
import 'package:project_z/features/home/presentation/widgets/product_card.dart';

class LoadingProductsGrid extends StatelessWidget {
  const LoadingProductsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics:
      const NeverScrollableScrollPhysics(),
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          childAspectRatio: 156 / 270),
      itemCount: 4,
      itemBuilder: (context, index) {
        return const LoadingProductWidget();
      },
    );
  }
}