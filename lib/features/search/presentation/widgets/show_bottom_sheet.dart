import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:project_z/core/routing/router.dart';
import 'package:project_z/features/search/presentation/bloc/search_screen_bloc.dart';
import 'package:project_z/shared/consts/text_style_title.dart';
import 'package:project_z/core/domain/entity/entity.dart' as e;

class Filter {
  static List<e.Category> enabled = [];
  static double? from;
  static double? to;
  static Map<e.Category, List<e.Category>> struct = {};
}

void showBottomDrawer(
    BuildContext context,
    List<e.Category> enabled,
    Map<e.Category, List<e.Category>> struct
    ) {
  Filter.struct = Map.from(struct);
  Filter.enabled = List.from(enabled);
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const BottomDrawer(),
  ).then((_) {
    //Logger().i('[Filter] ${Filter.enabled.map((e) => e.name)}');
    BlocProvider.of<SearchScreenBloc>(context).add(SearchScreenEvent.loading(
        categories: Filter.enabled, to: Filter.to, from: Filter.from));
  });
}

class BottomDrawer extends StatefulWidget {
  const BottomDrawer({super.key});

  @override
  State<BottomDrawer> createState() => _BottomDrawerState();
}

class _BottomDrawerState extends State<BottomDrawer> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();

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
        children: [
          // Заголовок с кнопкой закрытия
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
          // Контент меню
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 26),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Kategoriyalar', style: titleTextStyle),
                ),

                ///
                /// КАТЕГОРИИ
                ///

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: Filter.struct.entries.map((e) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (e.value.isNotEmpty) return;
                                  Logger().i('[tap category] ${e.key}');
                                  setState(() {
                                    if (Filter.enabled.contains(e.key)) {
                                      Filter.enabled.remove(e.key);
                                      return;
                                    }
                                    Filter.enabled.add(e.key);
                                  });
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      e.key.name,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                    (Filter.enabled.contains(e.key))
                                        ? const Icon(Icons.check,
                                            color: Colors.green, size: 16)
                                        : const SizedBox()
                                  ],
                                ),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: Filter.struct[e.key]!.map((e) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 14),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (Filter.enabled.contains(e)) {
                                              Filter.enabled.remove(e);
                                              return;
                                            }
                                            Filter.enabled.add(e);
                                          });
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              e.name,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                            (Filter.enabled.contains(e))
                                                ? const Icon(
                                                    Icons.check,
                                                    color: Colors.green,
                                                    size: 16,
                                                  )
                                                : const SizedBox()
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList())
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                ///
                /// КАТЕГОРИИ
                ///

                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Narx, So’m', style: titleTextStyle),
                  ),
                ),

                ///
                /// ЦЕНА
                ///

                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    children: [
                      Container(
                        width: 156,
                        height: 50,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextField(
                          controller: fromController,
                          onChanged: (str) {
                            Filter.from = double.tryParse(str);
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16.0),
                              hintText: 'От',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(167, 167, 167, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        width: 156,
                        height: 50,
                        margin: const EdgeInsets.only(left: 4),
                        // Половина от общего расстояния 8
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextField(
                          controller: toController,
                          onChanged: (str) {
                            Filter.to = double.tryParse(str);
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16.0),
                              hintText: 'До',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(167, 167, 167, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                )

                ///
                /// ЦЕНА
                ///
              ],
            ),
          ),
        ],
      ),
    );
  }
}
