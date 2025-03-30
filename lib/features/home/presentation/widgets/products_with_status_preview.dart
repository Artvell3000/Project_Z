import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/home/presentation/bloc/home_screen_bloc.dart';
import 'package:project_z/features/home/presentation/widgets/part_title_widget.dart';
import 'package:project_z/features/home/presentation/widgets/product_card.dart';

class ProductsWithStatusPreview extends StatelessWidget {
  const ProductsWithStatusPreview(
      {super.key,
      required this.onTapMoreProducts,
      required this.title,
      required this.status,});

  final void Function() onTapMoreProducts;
  final String title;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: PartTitleWidget(title: title, onTapMore: onTapMoreProducts),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
              builder: (context, state) {
                return state.when(
                  error: (message) {
                    return Center(child: Text(message));
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  loaded: (_, __, newProd, special) {
                    final used = (status == 'yangilik') ? newProd : special;
                    return SizedBox(
                      height: state.mapOrNull(loaded: (d) {
                            return used.length >= 3 ? 620 : 320;
                          }) ??
                          0,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                childAspectRatio: 156 / 261),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          if (index >= used.length) {
                            return const SizedBox();
                          }
                          return GestureDetector(
                            onTap: () {
                              AutoRouter.of(context).push(ProductRoute(
                                productId: used[index].id,
                              ));
                            },
                            child: ProductCard(
                              info: used[index],
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
