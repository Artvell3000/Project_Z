import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_z/shared/consts/colors.dart';

class SearchElevatedButton extends StatelessWidget {
  const SearchElevatedButton({
    super.key,
    required this.onClick,
    required this.text,
    this.imgLeft,
    this.imgRight,
    this.iconSize = 12.0,
    this.iconColor = Colors.white,
    this.spaceBetween = 8.0,
    this.isActive = true
  });

  final void Function(BuildContext context) onClick;
  final String text;
  final String? imgLeft;
  final String? imgRight;
  final double iconSize;
  final Color iconColor;
  final double spaceBetween;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onClick(context),

      style: ElevatedButton.styleFrom(
        backgroundColor: (isActive) ? mainColor : Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (imgLeft != null) ...[
              SvgPicture.asset(
                imgLeft!,
                height: iconSize,
                color: iconColor,
              ),
              SizedBox(width: spaceBetween),
            ],
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
            if (imgRight != null) ...[
              SizedBox(width: spaceBetween),
              SvgPicture.asset(
                imgRight!,
                height: iconSize,
                color: iconColor,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
