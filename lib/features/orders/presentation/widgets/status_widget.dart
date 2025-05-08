import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderStatusIcon extends StatelessWidget {
  OrderStatusIcon({super.key, required this.status});

  final String status;

  final String _onUnexpectedStatus = 'assets/order/time-left.svg';

  final Map<String, String> _statusToPath = {
    'Yetkazib berildi':'assets/order/check.svg',
    'Bekor qilindi':'assets/order/error.svg',
    'Jarayonda':'assets/order/time-left.svg',
  };

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      _statusToPath[status] ?? _onUnexpectedStatus,
      height: 24,
    );
  }
}
