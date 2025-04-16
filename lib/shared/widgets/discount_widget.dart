import 'package:flutter/material.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({
    super.key,
    required this.value,
  });

  final String? value;

  @override
  Widget build(BuildContext context) {
    return (value == null || value == '' || value == '0')
        ? const SizedBox()
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(17.0),
            ),
            child: Text(
              '-$value%',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 12.0,
              ),
            ),
          );
  }
}
