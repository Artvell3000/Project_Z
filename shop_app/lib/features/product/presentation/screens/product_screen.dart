import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/features/product/presentation/bloc/product_screen_bloc.dart';
import 'package:project_z/features/product/presentation/widgets/widgets.dart';
import 'package:project_z/shared/consts/colors.dart';

@RoutePage()
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<ProductScreenBloc>(param1: productId),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: BlocBuilder<ProductScreenBloc, ProductScreenState>(builder: (context, state) {
            return state.when(
              loading: () => const Scaffold(body: Center(child: CircularProgressIndicator(color: mainColor))),
              loadedProducts: (product, newProducts) {
                return SingleChildScrollView(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: ProductTitle(
                        title: product.name,
                        quantity: product.quantity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ProductGallery(imageUrls: product.images),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ProductCharacteristicsWidget(
                        info: product.description,
                        characteristics: product.characteristics,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SummaActionsWidget(
                        product.id,
                        summa: product.formattedFinalPrice,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: SummaInfoWidget(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: NewProductsWidget(products: newProducts),
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ]),
                );
              },
              errorProducts: (e) => Center(
                child: Text(e),
              ),
            );
          }),
        ),
      ),
    );
  }
}
