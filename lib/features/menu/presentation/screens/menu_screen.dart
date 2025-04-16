import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:project_z/features/menu/presentation/widgets/widgets.dart';
import 'package:project_z/features/product/presentation/widgets/widgets.dart';
import 'package:project_z/shared/consts/text_style_title.dart';
import 'package:project_z/shared/scaffolds/z_scaffold.dart';

@RoutePage()
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ZScaffold(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: FastNavigation(),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 15),
            child: Text('Mening sahifam', style: titleTextStyle),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MenuItemWidget(
              name: 'Mening Sahifam',
              onClick: (){

              },
            ),
            MenuItemWidget(
              name: 'Xaridlar tarixi',
              onClick: (){

              },
            ),
            MenuItemWidget(
              name: 'Chiqish',
              textColor: Colors.red,
              onClick: (){

              },
            ),
          ],
        )
      ],
    );
  }
}