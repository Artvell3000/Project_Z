import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: const Color.fromRGBO(236, 236, 236, 1.0),
        highlightColor: const Color.fromRGBO(253, 253, 253, 1.0),
        child: const Card(elevation: 0, child: SizedBox.expand()));
  }
}