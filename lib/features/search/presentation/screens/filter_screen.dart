import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:project_z/core/di/di.dart';
import 'package:project_z/core/domain/entity/category/category.dart';
import 'package:project_z/features/search/domain/entity/search_filter.dart';
import 'package:project_z/features/search/presentation/bloc/filter_widget/filter_screen_bloc.dart';
import 'package:project_z/features/search/presentation/consts/text_styles.dart';
import 'package:project_z/features/search/presentation/widgets/price_from_to_widget.dart';
import 'package:project_z/shared/consts/text_style_title.dart';
import 'package:project_z/shared/widgets/loading_card.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen(this._filter, {super.key});

  final SearchFilter _filter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FilterScreenBloc>(param1: _filter),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
              'Фильтры',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    final bloc = BlocProvider.of<FilterScreenBloc>(context);
                    Logger().i(bloc.filter.toString());
                    Navigator.of(context).pop(bloc.filter);
                  },
                  child: SvgPicture.asset(
                    'assets/app_bar/close.svg',
                    width: 46,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text('Kategoriyalar', style: titleTextStyle),
                ),
                CatalogWidget(),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text('Narx, So’m', style: titleTextStyle),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: PriceFromToWidget(
                    initFrom: _filter.from,
                    initTo: _filter.to,
                    onChangedInterval: (from, to) {
                      final bloc = BlocProvider.of<FilterScreenBloc>(context);
                      bloc.from = from;
                      bloc.to = to;
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class CatalogWidget extends StatefulWidget {
  const CatalogWidget({super.key});

  @override
  State<CatalogWidget> createState() => _CatalogWidgetState();
}

class _CatalogWidgetState extends State<CatalogWidget> with WidgetsBindingObserver {
  bool showCatalog = true;
  double _bottomInset = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final newBottomInset = MediaQuery.of(context).viewInsets.bottom;
    if (newBottomInset > 0 && _bottomInset == 0) {
      // Клавиатура показана
      if (showCatalog) {
        setState(() {
          showCatalog = false;
        });
      }
    } else if (newBottomInset == 0 && _bottomInset > 0) {
      // Клавиатура скрыта
      if (!showCatalog) {
        setState(() {
          showCatalog = true;
        });
      }
    }
    _bottomInset = newBottomInset;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: showCatalog
          ? SizedBox(
              height: 300,
              child: BlocBuilder<FilterScreenBloc, FilterScreenState>(
                builder: (context, state) {
                  final bloc = BlocProvider.of<FilterScreenBloc>(context);
                  return state.map(
                    loading: (d) => const LoadingMainCategoryList(),
                    loaded: (d) => MainCategoryList(
                      d.categories,
                      onPressed: (category) {
                        bloc.add(FilterScreenEvent.loadingSubcategories(category));
                      },
                    ),
                    showingMainCategories: (d) => MainCategoryList(
                      d.categories,
                      onPressed: (category) {
                        bloc.add(FilterScreenEvent.loadingSubcategories(category));
                      },
                    ),
                    showingSubCategories: (d) => SubCategoryList(
                      parent: d.parent,
                      subcategories: d.categories,
                      onClickChild: (category) {
                        bloc.enabled = category;
                      },
                      onClickParent: (category) {
                        bloc.add(const FilterScreenEvent.loadingMainCategories());
                      },
                    ),
                    error: (d) => Text(d.e.toString()),
                  );
                },
              ),
            )
          : const SizedBox(),
    );
  }
}

class SubCategoryList extends StatefulWidget {
  const SubCategoryList(
      {super.key,
      required this.parent,
      required this.subcategories,
      required this.onClickParent,
      required this.onClickChild});

  final Category parent;
  final List<Category> subcategories;

  final void Function(Category category) onClickParent;
  final void Function(Category? category) onClickChild;

  @override
  State<SubCategoryList> createState() => _SubCategoryListState();
}

class _SubCategoryListState extends State<SubCategoryList> {
  Category? enabled;

  @override
  void initState() {
    enabled = BlocProvider.of<FilterScreenBloc>(context).enabled;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => widget.onClickParent(widget.parent),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.parent.name.replaceAll('\u2028', ' '),
                style: mainCategoryTextStyle,
              ),
              const Icon(Icons.keyboard_arrow_up, size: 30),
            ],
          ),
        ),
        (widget.subcategories.isEmpty)
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        if(enabled == widget.subcategories[index]){
                          enabled = null;
                          widget.onClickChild(null);
                        } else {
                          enabled = widget.subcategories[index];
                          widget.onClickChild(widget.subcategories[index]);
                        }
                        setState((){});
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.subcategories[index].name.replaceAll('\u2028', ' '),
                            style: subCategoryTextStyle,
                          ),
                          (enabled == widget.subcategories[index] ) ? const Icon(
                            Icons.check,
                            color: Colors.green ,
                          ) : const SizedBox()
                        ],
                      ),
                    );
                  },
                  itemCount: widget.subcategories.length,
                ),
              )
      ],
    );
  }
}

class LoadingMainCategoryList extends StatelessWidget {
  const LoadingMainCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemBuilder: (context, index) {
        return const SizedBox(
          width: 120,
          height: 30,
          child: LoadingCard(),
        );
      },
      itemCount: 5,
    );
  }
}

class MainCategoryList extends StatelessWidget {
  const MainCategoryList(this._categories, {super.key, required this.onPressed});

  final List<Category> _categories;
  final void Function(Category category) onPressed;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () => onPressed(_categories[index]),
          title: Text(
            _categories[index].name.replaceAll('\u2028', ' '),
            style: mainCategoryTextStyle,
          ),
          trailing: const Icon(Icons.keyboard_arrow_down, size: 30),
          contentPadding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
        );
      },
      itemCount: _categories.length,
    );
  }
}
