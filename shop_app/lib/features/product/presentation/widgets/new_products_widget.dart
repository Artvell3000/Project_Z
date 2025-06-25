import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/home/presentation/widgets/part_title_widget.dart';
import 'package:project_z/features/home/presentation/widgets/product_card.dart';
import 'package:project_z/features/product/presentation/bloc/product_screen_bloc.dart';
import 'package:project_z/gen_locales/app_localizations.dart';
import 'package:shop_domain/domain/entity/product/product.dart';

class NewProductsWidget extends StatelessWidget {
  const NewProductsWidget({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: PartTitleWidget(
              title: AppLocalizations.of(context).homeNewProductsTitle, onTapMore: () {}),
        ),
        BlocBuilder<ProductScreenBloc, ProductScreenState>(
          builder: (context, state) {
            return state.map(
                loading: (d) =>
                const Center(
                  child: CircularProgressIndicator(),
                ),
                loadedProducts: (d) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 156 / 261),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      if (index >= products.length) {
                        return const SizedBox();
                      }
                      return GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(ProductRoute(
                            productId: products[index].id,
                          ));
                        },
                        child: ProductCard(
                          info: products[index],
                        ),
                      );
                    },
                  );
                },
                errorProducts: (d) =>
                    Center(child: Text(d.productError)));
          },
        )
      ],
    );
  }
}
