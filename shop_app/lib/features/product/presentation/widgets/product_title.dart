import 'package:flutter/material.dart';
import 'package:project_z/config/theme/text_styles_extension.dart';
import 'package:project_z/shared/widgets/quantity_widget.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    super.key, required this.title, required this.quantity,
  });
  final String title;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).extension<AppTextStyles>()!.heading;
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
            style: textStyle,
          ),
        ),
        QuantityWidget(quantity)
      ],
    );
  }
}