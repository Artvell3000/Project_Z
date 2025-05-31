import 'package:flutter/material.dart';
import 'package:project_z/shared/consts/text_style_title.dart';
import 'package:shop_domain/domain/entity/category/category.dart';

class CatalogWidget extends StatefulWidget {
  const CatalogWidget(
      {super.key, required this.height, required this.width, required this.struct, required this.onSelectSubcategory});

  final Map<Category, List<Category>> struct;
  final void Function(Category category) onSelectSubcategory;
  final double height;
  final double width;

  static const mainCategoryTextStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black);
  static const subcategoryTextStyle = TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.grey);

  @override
  State<CatalogWidget> createState() => _CatalogWidgetState();
}

class _CatalogWidgetState extends State<CatalogWidget> {
  late final List<Category> _mainCategories;
  Category? _enabledMainCategory;
  Category? _enabledSubcategory;
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
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text('Kategoriyalar', style: titleTextStyle),
        ),
        const SizedBox(height: 5,),
        SizedBox(
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
                        padding: EdgeInsets.only(top: (index - 1 == 0) ? 14 : 10, left: 20),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _enabledSubcategory = subcategories[index - 1];
                                widget.onSelectSubcategory(_enabledSubcategory!);
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  subcategories[index - 1].name,
                                  style: CatalogWidget.subcategoryTextStyle,
                                ),
                                (_enabledSubcategory != subcategories[index - 1])
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
        ),
      ],
    );
  }
}
