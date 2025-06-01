import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

final GlobalKey<ProfileTabScreenState> profileTabKey = GlobalKey<ProfileTabScreenState>();

@RoutePage()
class ProfileTabScreen extends StatefulWidget {
  const ProfileTabScreen({super.key});

  @override
  State<ProfileTabScreen> createState() => ProfileTabScreenState();
}

class ProfileTabScreenState extends State<ProfileTabScreen> {
  void resetTab() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}




