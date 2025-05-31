import 'package:flutter/material.dart';

class ProfileSurnameTextField extends StatefulWidget {
  const ProfileSurnameTextField(
      {super.key, required BuildContext context, required this.name, required this.onFullNameEntered});

  final String name;
  final void Function(String name) onFullNameEntered;

  @override
  State<ProfileSurnameTextField> createState() => _ProfileSurnameTextFieldState();
}

class _ProfileSurnameTextFieldState extends State<ProfileSurnameTextField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _controller.text = widget.name;
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        if (_controller.text.length > 5) {
          widget.onFullNameEntered(_controller.text);
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: SizedBox(
        height: 40,
        child: TextField(
          focusNode: _focusNode,
          controller: _controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromRGBO(245, 245, 247, 1),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
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
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
