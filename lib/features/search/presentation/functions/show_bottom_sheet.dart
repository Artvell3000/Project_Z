import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_z/features/search/domain/entity/search_filter.dart';
import 'package:project_z/features/search/presentation/bloc/search_screen/search_screen_bloc.dart';
import 'package:project_z/features/search/presentation/screens/filter_screen.dart';
import 'package:project_z/features/search/presentation/widgets/widgets.dart';
import 'package:project_z/shared/consts/text_style_title.dart';
import 'package:project_z/shared/widgets/catalog_widget.dart';

class ShowBottomDrawerFunction {
  static Future<SearchFilter?> body(BuildContext context, SearchFilter initFilter) async {
    return await showModalBottomSheet<SearchFilter?>(
      enableDrag: false,
      isDismissible: false,
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * (500 / 624),
      ),
      backgroundColor: Colors.transparent,
      builder: (context) => BottomDrawer(initFilter),
    );
  }
}

class BottomDrawer extends StatelessWidget {
  const BottomDrawer(this._filter, {super.key});

  final SearchFilter _filter;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      child: Container(
        height: MediaQuery.of(context).size.height * (580 / 624),
        color: const Color.fromRGBO(245, 245, 247, 1),
        child: FilterScreen(_filter),
      ),
    );
  }
}

