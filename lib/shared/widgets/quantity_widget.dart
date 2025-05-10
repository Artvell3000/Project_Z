import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget(this._quantity, {
    super.key,
  });

  final int _quantity;

  @override
  Widget build(BuildContext context) {
    final quantityStr =  AppLocalizations.of(context)!.quantity;
    return Container(
      height: 30,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Center(
          child: Text('$_quantity $quantityStr', style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color.fromRGBO(167, 167, 167, 1)
          ),),
        ),
      ),
    );
  }
}