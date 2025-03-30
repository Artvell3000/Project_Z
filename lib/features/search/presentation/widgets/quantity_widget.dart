import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/features/search/presentation/bloc/search_screen_bloc.dart';
import 'package:project_z/shared/consts/text_style_title.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    super.key,
    required this.quantity,
  });

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Barcha mahsulotlar',
          style: titleTextStyle,
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: BlocBuilder<SearchScreenBloc, SearchScreenState>(
                builder: (context, state) {
              return Text(
                '$quantity Maxsulot',
                style: const TextStyle(fontSize: 16.0, color: Colors.grey),
              );
            })),
      ],
    );
  }
}
