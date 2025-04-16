import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    super.key, required this.name, required this.onClick, this.textColor,
  });

  final String name;
  final void Function() onClick;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 37,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(name, style: TextStyle(
              fontSize: 14,
              //fontWeight: FontWeight.w500,
              color: textColor
          )),
        ),
      ),
    );
  }
}