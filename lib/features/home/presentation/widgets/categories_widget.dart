import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/core/domain/entity/category/category.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/home/presentation/bloc/home_screen_bloc.dart';
import 'package:project_z/features/home/presentation/widgets/part_title_widget.dart';
import 'package:project_z/features/search/domain/entity/search_filter.dart';
import 'package:project_z/shared/widgets/loading_card.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget({
    super.key,
    required this.onTapMoreCategories,
  });

  final void Function() onTapMoreCategories;

  void _moveToSearchWithCategories(BuildContext context, Category category) {
    final bloc = BlocProvider.of<HomeScreenBloc>(context);
    AutoRouter.of(context).push(SearchRoute(initFilter: SearchFilter(subcategories: bloc.getSubcategories(category))));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PartTitleWidget(title: 'Kategoriya.', onTapMore: onTapMoreCategories),
        BlocBuilder<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) => state.when(
            error: (e) => Center(child: Text(e.toString())),
            loading: () => GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 4, childAspectRatio: 156 / 126),
              itemCount: 4,
              itemBuilder: (context, index) {
                return const LoadingCard();
              },
            ),
            loaded: (categories, _, __, ___) => GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 4, childAspectRatio: 156 / 126),
              itemCount: 4,
              itemBuilder: (context, index) {
                if (index >= categories.length) {
                  return const SizedBox();
                }
                return GestureDetector(
                  onTap: () => _moveToSearchWithCategories(context, categories[index]),
                  child: CategoryCard(categories[index]),
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
  const CategoryCard(this._category, {super.key});

  final Category _category;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Image.network(
            _category.mobileImage ?? '',
            fit: BoxFit.fitHeight,
            height: double.infinity,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10),
              child: SizedBox(
                height: 70,
                width: 150,
                child: Text(
                  _category.name,
                  style:
                      const TextStyle(color: Color.fromRGBO(16, 53, 91, 1), fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: SizedBox(
                height: 20,
                width: 70,
                child: Text(
                  _category.description,
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 8),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
