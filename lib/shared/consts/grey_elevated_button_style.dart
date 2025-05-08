import 'package:flutter/material.dart';

final greyButtonStyle = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: const Color.fromRGBO(245, 245, 247, 1),
    foregroundColor: const Color.fromRGBO(16, 53, 91, 1),
    side: const BorderSide(
      width: 1.5,
      color: Color.fromRGBO(197, 197, 197, 1),),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 0,
      ));