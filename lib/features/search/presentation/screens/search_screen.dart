import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/home/presentation/widgets/product_card.dart';
import 'package:project_z/features/product/presentation/widgets/widgets.dart';
import 'package:project_z/features/search/presentation/bloc/search_filter.dart';
import 'package:project_z/features/search/presentation/bloc/search_screen_bloc.dart';
import 'package:project_z/features/search/presentation/widgets/widgets.dart';
import 'package:project_z/shared/consts/text_style_for_elevation_button.dart';
import 'package:project_z/shared/scaffolds/z_scaffold.dart';
import 'package:project_z/core/domain/entity/entity.dart' as e;

@RoutePage()
class SearchScreen extends StatelessWidget {
  SearchScreen({super.key,  this.initFilter, this.startWithBottomSheet = false});
  final SearchFilter? initFilter;
  final bool startWithBottomSheet;
  bool showedStartBottomSheet = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchScreenBloc>(param1: initFilter),
      child: ZScaffold(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: FastNavigation(),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<SearchScreenBloc, SearchScreenState>(
                builder: (context, state) {
                  return state.when(
                      error: (message){
                        return Center(child: Text(message));
                      },
                      loading: () => const Center(child: CircularProgressIndicator(),),
                      loaded: (result,  quantity, List<e.Category> enabledC, Map<e.Category, List<e.Category>> struct, status) {
                        if(startWithBottomSheet && !showedStartBottomSheet){
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            showedStartBottomSheet = true;
                            showBottomDrawer(context, [], struct);
                          });
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            QuantityWidget(quantity: quantity,),
                            const SizedBox(height: 17.0),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      showBottomDrawer(context, enabledC, struct);
                                    },
                                    icon: const Icon(
                                      Icons.filter_list,
                                      color: Colors.white,
                                    ),
                                    label: const Text(
                                      'Фильтры',
                                      style: textStyleForElevationButton,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                Expanded(
                                  flex: 1,
                                  child: ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Colors.white,
                                    ),
                                    label: const Text(
                                      'Barchasi',
                                      style: textStyleForElevationButton,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            SizedBox(
                              height: (result.length / 2) * 300.0,
                              child: GridView.builder(
                                physics:
                                    const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 8,
                                        childAspectRatio: 156 / 270),
                                itemCount: result.length,
                                itemBuilder: (context, index) {
                                  if (index >= result.length) {
                                    return const SizedBox();
                                  }
                                  return GestureDetector(
                                    onTap: () {
                                      AutoRouter.of(context)
                                          .push(ProductRoute(
                                        productId: result[index].id,
                                      ));
                                    },
                                    child: ProductCard(
                                      info: result[index],
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        );
                      });
                },
              ),
            )
          ]),
    );
  }
}
