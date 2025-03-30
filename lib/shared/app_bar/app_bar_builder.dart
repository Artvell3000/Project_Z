import 'package:flutter/material.dart';
import 'package:project_z/flutter_app_icons.dart';

//todo создать Resourses
abstract class AppBarBuilder{
  static AppBar build(){
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.only(left:10.0, top: 10,bottom: 10),
        child: Icon(CustomIcons.geo, color: Colors.white,),
      ),
      centerTitle: false,
      titleSpacing: 0,
      title: const Text.rich(
        TextSpan(
          style: TextStyle(fontSize: 20, color: Colors.white),
          children: [
            TextSpan(text: 'Uzbekiston: '),
            TextSpan(
              text: 'Toshkent',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(16, 53, 91, 1),
    );
  }
}