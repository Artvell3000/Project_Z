import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/core/network/api/api_service.dart';
import 'package:project_z/features/product/presentation/bloc/product_screen_bloc.dart';
import 'package:project_z/features/product/presentation/widgets/widgets.dart';
import 'package:project_z/shared/consts/text_style_for_elevation_button.dart';
import 'package:project_z/shared/scaffolds/z_scaffold.dart';

@RoutePage()
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductScreenBloc>(param1: productId),
      child: BlocBuilder<ProductScreenBloc,ProductScreenState>(
          builder: (context, state){
            return state.when(
                loading: () => const Scaffold(body: Center(child: CircularProgressIndicator(),)),
                loadedProducts: (product, newProducts){
                  return ZScaffold(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 12.0),
                          child: FastNavigation(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: ProductTitle(title: product.name, quantity: product.quantity,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ProductGallery(
                              imageUrls: product.images.map((e) => e.image).toList()
                          ),
                        ),
                        Padding(
                          padding:const EdgeInsets.only(top: 20),
                          child: ProductCharacteristicsWidget(
                            info: product.description,
                            characteristics: product.characteristics,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SummaActionsWidget(summa: product.formattedFinalPrice,),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: SummaInfoWidget(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: NewProductsWidget(products: newProducts),
                        ),
                        const SizedBox(height: 50,)
                      ]
                  );
                },
                errorProducts: (e) => Center(child: Text(e),),
            );
          }
      ),
    );
  }
}

