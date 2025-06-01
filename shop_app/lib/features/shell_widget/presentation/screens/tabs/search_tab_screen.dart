import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

final GlobalKey<SearchTabScreenState> searchTabKey = GlobalKey<SearchTabScreenState>();

@RoutePage()
class SearchTabScreen extends StatefulWidget {
  const SearchTabScreen({super.key});

  @override
  State<SearchTabScreen> createState() => SearchTabScreenState();
}

class SearchTabScreenState extends State<SearchTabScreen> {
  void resetTab() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}