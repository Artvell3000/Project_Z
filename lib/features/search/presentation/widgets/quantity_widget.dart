import 'package:flutter/material.dart';
import 'package:project_z/shared/consts/text_style_title.dart';
import 'package:project_z/shared/widgets/quantity_widget.dart';

class SearchQuantityWidget extends StatelessWidget {
  const SearchQuantityWidget({
    super.key,
    required this.quantity,
  });

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Barcha mahsulotlar',
          style: titleTextStyle,
        ),
        QuantityWidget(quantity: quantity),
      ],
    );
  }
}
