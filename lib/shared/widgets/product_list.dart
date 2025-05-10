import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_z/core/domain/entity/product/product.dart';
import 'package:project_z/features/orders/presentation/widgets/order_info_widget/order_info_widget.dart';
import 'package:project_z/shared/widgets/discount_widget.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.items});
  final List<Product> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: min(300, items.length*100),
      width: 400,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final product = items[index];
          return Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(product.images.first, height: 82)
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: (product.discount == 0) ? 190 : 140,
                          child: Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                        ),
                        DiscountWidget(value: product.discount,)
                      ],
                    ),
                    Text(
                      'ID ${product.id}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(97, 97, 97, 1),
                      ),
                    ),
                    const Text(
                      'Maxsulot narxi',
                      style: labelTextStyle,
                    ),
                    Text(
                      '${product.finalPrice} so\'m',
                      style: valueTextStyle,
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
