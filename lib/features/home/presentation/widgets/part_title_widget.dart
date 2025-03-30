import 'package:flutter/material.dart';
import 'package:project_z/flutter_app_icons.dart';

class PartTitleWidget extends StatelessWidget {
  const PartTitleWidget({
    super.key,
    required this.onTapMore, required this.title,
  });

  final void Function() onTapMore;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            //color: Color.fromRGBO(16, 53, 91, 1),
          ),
        ),
        TextButton(
          onPressed: onTapMore,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Barchasi',
                style: TextStyle(fontSize: 14),
              ),
              Icon(Icons.chevron_right, size: 32,),
            ],
          ),
        )
      ],
    );
  }
}