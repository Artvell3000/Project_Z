import 'package:flutter/material.dart';
import 'package:project_z/shared/consts/text_style_title.dart';

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
        Container(
          height: 30,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Center(
              child: Text('$quantity Maxsulot', style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color.fromRGBO(167, 167, 167, 1)
              ),),
            ),
          ),
        )
      ],
    );
  }
}