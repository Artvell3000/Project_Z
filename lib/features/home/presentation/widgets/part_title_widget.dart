import 'package:flutter/material.dart';
import 'package:project_z/flutter_app_icons.dart';
import 'package:project_z/shared/consts/colors.dart';

class PartTitleWidget extends StatelessWidget {
  const PartTitleWidget({
    super.key,
    required this.onTapMore,
    required this.title,
  });

  final void Function() onTapMore;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: onTapMore,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Barchasi',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              Icon(
                Icons.chevron_right_rounded,
                size: 32,
                color: mainColor,
              ),
            ],
          ),
        )
      ],
    );
  }
}
