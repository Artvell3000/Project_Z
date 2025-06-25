import 'package:flutter/material.dart';
import 'package:project_z/config/theme/text_styles_extension.dart';

class TextFieldForFullName extends StatefulWidget {
  const TextFieldForFullName({super.key, required this.initText, required this.onNameEntered});
  final String initText;
  final void Function(String fullName) onNameEntered;

  @override
  State<TextFieldForFullName> createState() => _TextFieldForFullNameState();
}

class _TextFieldForFullNameState extends State<TextFieldForFullName> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initText;
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    if (!_focusNode.hasFocus) {
      widget.onNameEntered(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).extension<AppTextStyles>();
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      style: textStyles?.textField ?? AppTextStyles.defaultTextField,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromRGBO(245, 245, 247, 1),
        contentPadding: const EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color.fromRGBO(197, 197, 197, 1),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color.fromRGBO(197, 197, 197, 1),
            width: 1,
          ),
        ),
      ),
    );
  }
}
