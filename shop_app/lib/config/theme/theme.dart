import 'package:flutter/material.dart';

final onlineShopTheme = ThemeData(
  fontFamily: 'Neometric',
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      backgroundColor: const Color.fromRGBO(16, 53, 91, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);
