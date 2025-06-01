import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

final GlobalKey<BasketTabScreenState> basketTabKey = GlobalKey<BasketTabScreenState>();

@RoutePage()
class BasketTabScreen extends StatefulWidget {
  const BasketTabScreen({super.key});

  @override
  State<BasketTabScreen> createState() => BasketTabScreenState();
}

class BasketTabScreenState extends State<BasketTabScreen> {
  void resetTab() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}