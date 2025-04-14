import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_z/constants/product/status.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/home/presentation/bloc/home_screen_bloc.dart';
import 'package:project_z/features/home/presentation/widgets/widgets.dart';
import 'package:project_z/features/search/domain/entity/search_filter.dart';
import 'package:project_z/shared/scaffolds/z_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void onTapSearchInUnderAppBarWidget() {

  }

  void onTapMenuInUnderAppBarWidget() {}

  void onTapNewsWidget() {}

  void onTapMoreCategories(BuildContext context) {
    AutoRouter.of(context).push(SearchRoute(startWithBottomSheet: true));
  }

  void onTapMoreNewProducts(BuildContext context) {
    AutoRouter.of(context).push(SearchRoute(
        initFilter: const SearchFilter(status: newProductStatus)
    ));
  }

  void onTapMoreSpecialOffers(BuildContext context) {
    AutoRouter.of(context).push(SearchRoute(
        initFilter: const SearchFilter(status: specialOfferStatus)
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeScreenBloc>(),
      child: ZScaffold(
        children: [
          NewsWidget(
            onTap: onTapNewsWidget,
            currentNews: 0,
          ),
          CategoriesWidget(
            onTapMoreCategories: () => onTapMoreCategories(context),
          ),
          NewProductsWidget(
            onTapMoreNewProducts: () => onTapMoreNewProducts(context),
          ),
          NewsWidget(
            onTap: onTapNewsWidget,
            currentNews: 1,
          ),
          SpecialOffersWidget(
            onTapMoreSpecialOffers: () => onTapMoreSpecialOffers(context),
          ),
          MessageWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(
                'assets/footer/footer.svg',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}





