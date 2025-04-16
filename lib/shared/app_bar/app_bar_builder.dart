import 'package:flutter/material.dart';
import 'package:project_z/flutter_app_icons.dart';

abstract class AppBarBuilder {
  static AppBar build() {
    return AppBar(
      toolbarHeight: 30,
      leading: const Padding(
        padding: EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
        child: Icon(
          CustomIcons.geo,
          color: Colors.white,
          size: 12,
        ),
      ),
      centerTitle: false,
      titleSpacing: 0,
      title: const FractionalTranslation(
        translation: Offset(-0.1, 0.2),
        child: Text.rich(
          TextSpan(
            style: TextStyle(fontSize: 12, color: Colors.white),
            children: [
              TextSpan(text: 'Uzbekiston'),
              TextSpan(
                text: ': Toshkent',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(16, 53, 91, 1),
    );
  }
}
