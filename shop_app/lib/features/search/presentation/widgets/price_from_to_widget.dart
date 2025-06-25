import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceFromToWidget extends StatefulWidget {
  const PriceFromToWidget({super.key, required this.onChangedInterval, this.initFrom, this.initTo});

  final double? initFrom;
  final double? initTo;
  final void Function(double? from, double? to) onChangedInterval;

  @override
  State<PriceFromToWidget> createState() => _PriceFromToWidgetState();
}

class _PriceFromToWidgetState extends State<PriceFromToWidget> {
  final _fromFocusNode = FocusNode();
  final _toFocusNode = FocusNode();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();



  @override
  void initState() {
    super.initState();
    _fromController.text = widget.initFrom?.toStringAsFixed(2) ?? '';
    _toController.text = widget.initTo?.toStringAsFixed(2) ?? '';
    _fromFocusNode.addListener(_onFocusChange);
    _toFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    _fromFocusNode.dispose();
    _toFocusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_fromFocusNode.hasFocus && !_toFocusNode.hasFocus) {
      _notify();
    } else if (!_fromFocusNode.hasFocus && _toController.text.isNotEmpty) {
      _notify();
    } else if (!_toFocusNode.hasFocus && _fromController.text.isNotEmpty) {
      _notify();
    }
  }

  void _notify() {
    final from = double.tryParse(_fromController.text);
    final to = double.tryParse(_toController.text);

    if (from != null && to != null && from > to) {
      return;
    }

    widget.onChangedInterval(from, to);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _PriceTextField(
            controller: _fromController,
            focusNode: _fromFocusNode,
            hint: 'От',
          ),
        ),
        Expanded(
          child: _PriceTextField(
            controller: _toController,
            focusNode: _toFocusNode,
            hint: 'До',
          ),
        ),
      ],
    );
  }
}
class _PriceTextField extends StatelessWidget {
  const _PriceTextField({required this.hint, required this.controller, required this.focusNode});
  final String hint;
  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: const TextInputType.numberWithOptions(decimal: false),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color.fromRGBO(167, 167, 167, 1),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
