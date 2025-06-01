import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

final GlobalKey<OrdersTabScreenState> ordersTabKey = GlobalKey<OrdersTabScreenState>();

@RoutePage()
class OrdersTabScreen extends StatefulWidget {
  const OrdersTabScreen({super.key});

  @override
  State<OrdersTabScreen> createState() => OrdersTabScreenState();
}

class OrdersTabScreenState extends State<OrdersTabScreen> {
  void resetTab() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}