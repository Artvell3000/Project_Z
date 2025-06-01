import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

final GlobalKey<HomeTabScreenState> homeTabKey = GlobalKey<HomeTabScreenState>();

@RoutePage()
class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({super.key});

  @override
  State<HomeTabScreen> createState() => HomeTabScreenState();
}

class HomeTabScreenState extends State<HomeTabScreen> {
  void resetTab() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}