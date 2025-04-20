import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:project_z/features/search/presentation/bloc/search_screen_bloc.dart';
import 'package:project_z/features/search/presentation/widgets/widgets.dart';
import 'package:project_z/shared/consts/text_style_title.dart';
import 'package:project_z/core/domain/entity/entity.dart' as e;

class Filter {
  e.Category? enabled;
  double? from;
  double? to;
}

void showBottomDrawer(BuildContext context, e.Category? enabled, Map<e.Category, List<e.Category>> struct) {
  final filter = Filter();
  filter.enabled = enabled;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => BottomDrawer(filter: filter, struct: struct,),
  ).then((_) {
    BlocProvider.of<SearchScreenBloc>(context)
        .add(SearchScreenEvent.loading(categories: filter.enabled, to: filter.to, from: filter.from));
  });
}

class BottomDrawer extends StatefulWidget {
  const BottomDrawer({super.key, required this.filter, required this.struct});
  final Filter filter;
  final Map<e.Category, List<e.Category>> struct;
  @override
  State<BottomDrawer> createState() => _BottomDrawerState();
}

class _BottomDrawerState extends State<BottomDrawer> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();

  bool tapedOnCategory = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * (564 / 624),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(245, 245, 247, 1),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
            ),
            child: Stack(
              children: [
                const SizedBox.expand(),
                const Center(child: Text('Фильтры', style: titleTextStyle)),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: SvgPicture.asset(
                      'assets/icons/close.svg',
                      width: 46,
                      height: 46,
                      fit: BoxFit.cover,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 26),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * (490 / 624),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Kategoriyalar', style: titleTextStyle),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: CatalogWidget(
                      height: 400,
                      width: double.infinity,
                      struct: widget.struct,
                      onSelectSubcategory: (category){
                        widget.filter.enabled = category;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: PriceFromToWidget(
                      onChangedInterval: (from, to) {
                        widget.filter.from = from;
                        widget.filter.to = to;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CatalogWidget extends StatefulWidget {
  const CatalogWidget({super.key, required this.height, required this.width, required this.struct, required this.onSelectSubcategory});

  final Map<e.Category, List<e.Category>> struct;
  final void Function(e.Category category) onSelectSubcategory;
  final double height;
  final double width;

  static const mainCategoryTextStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black);
  static const subcategoryTextStyle = TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.grey);

  @override
  State<CatalogWidget> createState() => _CatalogWidgetState();
}

class _CatalogWidgetState extends State<CatalogWidget> {
  late final List<e.Category> _mainCategories;
  e.Category? _enabledMainCategory;
  e.Category? _enabledSubcategory;
  bool _showScrollbar = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _mainCategories = widget.struct.keys.toList();
    _scrollController.addListener(_checkScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkScroll());
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_checkScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _checkScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    setState(() {
      _showScrollbar = maxScroll > 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Scrollbar(
        thumbVisibility: _showScrollbar,
        controller: _scrollController,
        child: (_enabledMainCategory == null)
            ? ListView.builder(
                controller: _scrollController,
                itemCount: _mainCategories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _enabledMainCategory = _mainCategories[index];
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _mainCategories[index].name,
                            style: CatalogWidget.mainCategoryTextStyle,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  );
                })
            : ListView.builder(
                controller: _scrollController,
                itemCount: widget.struct[_enabledMainCategory]!.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _enabledMainCategory = null;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _enabledMainCategory?.name ?? "None",
                              style: CatalogWidget.mainCategoryTextStyle,
                            ),
                            const Icon(
                              Icons.keyboard_arrow_up,
                              size: 30,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    );
                  }

                  final subcategories = widget.struct[_enabledMainCategory!]!;
                  return Padding(
                    padding: EdgeInsets.only(top: (index-1 == 0) ? 14 : 10, left: 20),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _enabledSubcategory = subcategories[index-1];
                            widget.onSelectSubcategory(_enabledSubcategory!);
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              subcategories[index-1].name,
                              style: CatalogWidget.subcategoryTextStyle,
                            ),
                            (_enabledSubcategory == null)
                                ? const SizedBox()
                                : const Icon(
                                    Icons.check,
                                    size: 20,
                                    color: Color.fromRGBO(16, 53, 91, 1),
                                  )
                          ],
                        )),
                  );
                }),
      ),
    );
  }
}
