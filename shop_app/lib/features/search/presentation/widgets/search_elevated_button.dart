import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_z/config/theme/colors.dart';

class SearchElevatedButton extends StatelessWidget {
  const SearchElevatedButton({
    super.key,
    required this.onClick,
    required this.text,
    this.imgLeft,
    this.imgRight,
    this.iconRightSize = 12.0,
    this.iconLeftSize = 9.0,
    this.activeContentColor = AppColors.primary,
    this.contentColor = Colors.white,
    this.spaceBetween = 8.0,
    this.isActive = true
  });

  final void Function(BuildContext context) onClick;
  final String text;
  final String? imgLeft;
  final String? imgRight;
  final double iconRightSize;
  final double iconLeftSize;
  final Color activeContentColor;
  final Color contentColor;
  final double spaceBetween;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onClick(context),

      style: ElevatedButton.styleFrom(
        backgroundColor: (isActive) ? activeContentColor : contentColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: SizedBox(
        height: 46,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (imgLeft != null) ...[
                SvgPicture.asset(
                  imgLeft!,
                  height: iconRightSize,
                  color: (isActive) ? contentColor : activeContentColor,
                ),
                SizedBox(width: spaceBetween),
              ],
              Text(
                text,
                style: TextStyle(color: (isActive) ? contentColor : activeContentColor),
              ),
              if (imgRight != null) ...[
                SizedBox(width: spaceBetween),
                SvgPicture.asset(
                  imgRight!,
                  height: iconLeftSize,
                  color: (isActive) ? contentColor : activeContentColor,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
