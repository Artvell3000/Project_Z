import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_z/core/domain/entity/order/order.dart';


const labelTextStyle = TextStyle(
    color: Color.fromRGBO(125, 125, 125, 1),
    fontWeight: FontWeight.w400,
    fontSize: 12
);

const valueTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.black
);

class OrderInfoContainer extends StatelessWidget {
  const OrderInfoContainer({super.key, required this.info});
  final OrderItem info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white, // Assuming the background is white
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
        border: Border.all(
          color: const Color.fromRGBO(197, 197, 197, 1), // Light gray border
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/order/check.svg', height: 24,),
                  const SizedBox(width: 10.0),
                  Text(
                    info.product.name, // Assuming this text
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              const Icon(Icons.keyboard_arrow_down), // Right arrow icon
            ],
          ),
          const SizedBox(height: 10.0),

          const Text(
            'Sana', // Assuming this text
            style: labelTextStyle
          ),
          const Text(
            '05.04.2023 10:47', // Assuming this text
            style: valueTextStyle,
          ),

          const SizedBox(height: 10.0),

          const Text(
            'Buyurtma ID raqami', // Assuming this text
            style: labelTextStyle,
          ),
          Text(
            '#${info.id}', // Assuming this text
            style: valueTextStyle,
          ),

          const SizedBox(height: 10.0),

          const Text(
            'Buyurtma narxi', // Assuming this text
            style: labelTextStyle,
          ),
          Text(
            '${info.product.finalPrice * info.amount} so\'m', // Assuming this text
            style: valueTextStyle,
          ),
        ],
      ),
    );
  }
}