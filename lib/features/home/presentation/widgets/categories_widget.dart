import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:project_z/core/domain/entity/category/category.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/home/presentation/bloc/home_screen_bloc.dart';
import 'package:project_z/features/home/presentation/widgets/part_title_widget.dart';
import 'package:project_z/features/search/presentation/bloc/search_filter.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget({
    super.key,
    required this.onTapMoreCategories,
  });

  final void Function() onTapMoreCategories;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: PartTitleWidget(
              title: 'Kategoriya.', onTapMore: onTapMoreCategories),
        ),
        SizedBox(
          width: double.infinity,
          height: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
              builder: (context, state) {
                return state.when(
                  error: (message){
                    return Center(child: Text(message));
                  },
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                  loaded: (categories, _, __, ___) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 156 / 126
                          ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        if (index >= categories.length) {
                          return const SizedBox();
                        }
                        return GestureDetector(
                          onTap: (){
                            AutoRouter.of(context).push(
                              SearchRoute(initFilter: SearchFilter(enabled: categories[index]))
                            );
                          },
                          child: CategoryCard(
                            title: categories[index].name,
                            lable: categories[index].description,
                            imgProvider: categories[index].mobileImage ?? 'assets/mock/categories/c1.png',
                            notFound: categories[index].mobileImage == null,
                          ),
                        );
                      },
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

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.lable,
    required this.imgProvider, required this.notFound,
  });

  final String title, lable, imgProvider;
  final bool notFound;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          const SizedBox.expand(),
          (!notFound)?Image.network(
            imgProvider,
            fit: BoxFit.cover,
            width: double.infinity,
          ) : Image.asset(
            imgProvider,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: FractionalTranslation(
              translation: const Offset(0.1, 0.1),
              child: SizedBox(
                height: 70,
                width: 60,
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Color.fromRGBO(16, 53, 91, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FractionalTranslation(
              translation: const Offset(0.1, -0.6),
              child: SizedBox(
                height: 20,
                width: 70,
                child: Text(
                  lable,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 8),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
