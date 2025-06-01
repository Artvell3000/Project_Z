import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:project_z/constants/product/status.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/home/presentation/bloc/home_screen_bloc.dart';
import 'package:project_z/features/home/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_domain/domain/entity/search_filter/search_filter.dart';


@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onTapSearchInUnderAppBarWidget() {

  }

  void onTapMenuInUnderAppBarWidget() {}

  void onTapNewsWidget() {}

  void onTapMoreCategories(BuildContext context) {
    Logger().i('tap more categories');
    AutoRouter.of(context).push(SearchRoute(startWithBottomSheet: true, initFilter: SearchFilter.empty));
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
    if(context.mounted){
      getIt<TabsRouter>().setActiveIndex(1);
    }
  }

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245,245,247,1),
      body: BlocProvider(
        create: (context) => getIt<HomeScreenBloc>(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: NewsWidget(
                        onTap: onTapNewsWidget,
                        currentNews: 0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: CategoriesWidget(
                        onTapMoreCategories: () => onTapMoreCategories(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: NewProductsWidget(
                        onTapMoreNewProducts: () => onTapMoreNewProducts(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: NewsWidget(
                        onTap: onTapNewsWidget,
                        currentNews: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: SpecialOffersWidget(
                        onTapMoreSpecialOffers: () => onTapMoreSpecialOffers(context),
                      ),
                    ),
                    //MessageWidget(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: SizedBox(
                  width: double.infinity,
                  child: SvgPicture.asset(
                    'assets/footer/footer.svg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}







