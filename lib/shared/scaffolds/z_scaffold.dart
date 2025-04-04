import 'package:flutter/material.dart';

class ZScaffold extends StatelessWidget {
  const ZScaffold({super.key, required this.children, this.padding});
  final List<Widget> children;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    //todo кастыль!
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: padding ?? const EdgeInsets.only(),
                child: Column(
                  children: children,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
