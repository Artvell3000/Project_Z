import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/home/presentation/widgets/product_card.dart';
import 'package:project_z/features/search/domain/entity/search_filter.dart';
import 'package:project_z/features/search/presentation/bloc/search_screen/search_screen_bloc.dart';
import 'package:project_z/features/search/presentation/widgets/widgets.dart';
import 'package:project_z/shared/consts/text_style_title.dart';
import 'package:project_z/shared/widgets/quantity_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, this.startWithBottomSheet = false, this.initFilter});

  final SearchFilter? initFilter;
  final bool startWithBottomSheet;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _scrollController = ScrollController();
  BuildContext? contextWithBloc;
  late SearchFilter currentFilter;
  bool _isLoading = false;

  Future<void> _showFilter(BuildContext context) async {
    final filter = await ShowBottomDrawerFunction.body(context, currentFilter);
    if (context.mounted && filter != null && currentFilter != filter) {
      //Logger().i(AutoRouter.of(context).stack);
      AutoRouter.of(context).push(SearchRoute(initFilter: filter));
      //Logger().i('[refresh search]');
      //currentFilter = filter;
      //BlocProvider.of<SearchScreenBloc>(context).add(SearchScreenEvent.refresh(filter));
    }
  }

  void _showAll(BuildContext context) {
    if (context.mounted) {
      AutoRouter.of(context).push(SearchRoute());
      //currentFilter = SearchFilter.empty;
      //BlocProvider.of<SearchScreenBloc>(context).add(SearchScreenEvent.refresh(currentFilter));
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    currentFilter = widget.initFilter?.copyWith() ?? SearchFilter.empty;
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    const threshold = 150.0;

    if (maxScroll - currentScroll <= threshold && !_isLoading && contextWithBloc != null) {
      _isLoading = true;
      BlocProvider.of<SearchScreenBloc>(contextWithBloc!).add(const SearchScreenEvent.loadMore());
    }
  }

  int getCountLoadingCard(int length, bool isAll) {
    if (isAll) return 0;
    return (length % 2 == 0) ? 2 : 3;
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color.fromRGBO(245, 245, 247, 1),
      child: Scaffold(
        body: BlocProvider(
          create: (context) => getIt<SearchScreenBloc>(param1: currentFilter),
          child: Builder(
            builder: (context) {
              return SingleChildScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.searchTitle,
                            style: titleTextStyle,
                          ),
                          BlocBuilder<SearchScreenBloc, SearchScreenState>(
                            buildWhen: (_, state) =>
                                state.mapOrNull(
                                  loaded: (d) => true,
                                ) ??
                                false,
                            builder: (context, state) {
                              return state.mapOrNull(
                                    loaded: (d) => QuantityWidget(d.quantity),
                                  ) ??
                                  const SizedBox();
                            },
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: SearchElevatedButton(
                              imgLeft: 'assets/search/filter.svg',
                              text: AppLocalizations.of(context)!.searchScreenFilterButtonText,
                              onClick: (context) => _showFilter(context),
                            )),
                        const SizedBox(width: 8.0),
                        Expanded(
                            flex: 1,
                            child: BlocBuilder<SearchScreenBloc, SearchScreenState>(
                              builder: (context, state) {
                                return SearchElevatedButton(
                                  imgRight: 'assets/search/arrow_down.svg',
                                  text: AppLocalizations.of(context)!.searchScreenAllButtonText,
                                  isActive: !currentFilter.isEmpty,
                                  onClick: (context) => _showAll(context),
                                );
                              },
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: BlocBuilder<SearchScreenBloc, SearchScreenState>(
                        builder: (context, state) {
                          return state.map(
                            error: (d) => Center(child: Text(d.e.toString())),
                            loading: (d) => const LoadingProductsGrid(),
                            loaded: (d) {
                              _isLoading = false;
                              contextWithBloc = context;
                              return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 4,
                                    mainAxisSpacing: 4,
                                    childAspectRatio: 156 / 270),
                                itemCount: d.products.length + getCountLoadingCard(d.products.length, d.isAllProducts),
                                itemBuilder: (context, index) {
                                  if (index >= d.products.length) {
                                    return const LoadingProductWidget();
                                  }

                                  final product = d.products[index];
                                  return GridTile(
                                    key: ValueKey(product.id),
                                    child: ProductCard(
                                      info: product,
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    )
                  ]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
