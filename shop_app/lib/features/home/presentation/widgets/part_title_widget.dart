import 'package:flutter/material.dart';
import 'package:project_z/l10n/app_localizations.dart';
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
      crossAxisAlignment: CrossAxisAlignment.center,
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                AppLocalizations.of(context)!.homeGoToAll,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
              const Icon(
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
