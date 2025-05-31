import 'package:flutter/material.dart';
import 'package:project_z/shared/consts/text_field_style.dart';

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
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      style: textStyleForTextField,
      decoration: textFieldDecoration,
    );
  }
}
