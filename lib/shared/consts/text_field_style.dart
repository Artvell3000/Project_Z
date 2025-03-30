import 'package:flutter/material.dart';

var textFieldStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: const BorderSide(
    color: Color.fromRGBO(16, 53, 91, 1),
    width: 1,
  ),
);

const textStyleForTextFieldStyle = TextStyle(
  color: Color.fromRGBO(16, 53, 91, 1),
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

const textStyleForLabel = TextStyle(
  color: Color.fromRGBO(125, 125, 125, 1),
  fontSize: 12,
  fontWeight: FontWeight.w500,
);

var textFieldDecoration = InputDecoration(
  filled: true,
  fillColor: const Color.fromRGBO(245, 245, 247, 1),
  contentPadding: const EdgeInsets.only(
    top: 15,
    left: 5,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      color: Color.fromRGBO(197, 197, 197, 1),
      width: 1,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      color: Color.fromRGBO(197, 197, 197, 1),
      width: 1,
    ),
  ),
);