import 'package:flutter/material.dart';
import 'package:project_z/shared/widgets/loading_card.dart';

class LoadingPinCodeInputWidget extends StatelessWidget {
  const LoadingPinCodeInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return const SizedBox(
          width: 50,
          height: 50,
          child: LoadingCard(),
        );
      }),
    );
  }
}
