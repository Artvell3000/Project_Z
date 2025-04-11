import 'package:flutter/material.dart';

class PinCodeInputRow extends StatefulWidget {
  const PinCodeInputRow({super.key, required this.toVerify});

  final void Function(String code) toVerify;

  @override
  _PinCodeInputRowState createState() => _PinCodeInputRowState();
}

class _PinCodeInputRowState extends State<PinCodeInputRow> {
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  // Функция, которая вызывается, когда все поля заполнены
  void _checkAllFieldsFilled() {
    final allFilled = _controllers.every((controller) => controller.text.isNotEmpty);
    if (allFilled) {
      StringBuffer code = StringBuffer();
      for (final el in _controllers) {
        code.write(el.text);
      }
      widget.toVerify(code.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return Container(
          width: 50,
          height: 50,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              counterText: "",
              filled: true,
              fillColor: const Color.fromRGBO(245, 245, 247, 1),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(197, 197, 197, 1),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                ),
              ),
            ),
            onChanged: (value) {
              if (value.length == 1 && index < 5) {
                _focusNodes[index + 1].requestFocus();
              } else if (value.isEmpty && index > 0) {
                _focusNodes[index - 1].requestFocus();
              }
              _checkAllFieldsFilled();
            },
          ),
        );
      }),
    );
  }
}
