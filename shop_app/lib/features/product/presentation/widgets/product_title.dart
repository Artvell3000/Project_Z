import 'package:flutter/material.dart';
import 'package:project_z/shared/consts/text_style_title.dart';
import 'package:project_z/shared/widgets/quantity_widget.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    super.key, required this.title, required this.quantity,
  });
  final String title;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width : 200,
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: titleTextStyle,
          ),
        ),
        QuantityWidget(quantity)
      ],
    );
  }
}