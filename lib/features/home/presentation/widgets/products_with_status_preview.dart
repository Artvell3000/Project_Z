import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/features/home/presentation/bloc/home_screen_bloc.dart';
import 'package:project_z/features/home/presentation/widgets/part_title_widget.dart';
import 'package:project_z/features/home/presentation/widgets/product_card.dart';

class ProductsWithStatusPreview extends StatelessWidget {
  const ProductsWithStatusPreview({
    super.key,
    required this.onTapMoreProducts,
    required this.title,
    required this.status,
  });

  final void Function() onTapMoreProducts;
  final String title;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PartTitleWidget(title: title, onTapMore: onTapMoreProducts),
        BlocBuilder<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) {
            return state.when(
              error: (e) {
                return Center(child: Text(e.toString()));
              },
              loading: () => GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8, childAspectRatio: 156 / 261),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const LoadingProductWidget();
                },
              ),
              loaded: (_, __, newProd, special) {
                final used = (status == 'yangilik') ? newProd : special;
                return GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 4, childAspectRatio: 156 / 261),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    if (index >= used.length) {
                      return const SizedBox();
                    }
                    return ProductCard(
                      info: used[index],
                    );
                  },
                );
              },
            );
          },
        )
      ],
    );
  }
}
