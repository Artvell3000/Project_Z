import 'package:flutter/material.dart';
import 'package:project_z/shared/functions/checker_phone.dart';
import 'package:project_z/shared/functions/show_alert_dialog/show_cant_change_phone_alert_dialog_function.dart';

class ProfilePhoneTextField extends StatefulWidget {
  const ProfilePhoneTextField({super.key, required this.phone, required this.onPhoneEntered});

  final void Function(String phone) onPhoneEntered;
  final String phone;

  @override
  State<ProfilePhoneTextField> createState() => _ProfilePhoneTextFieldState();
}

class _ProfilePhoneTextFieldState extends State<ProfilePhoneTextField> {
  final TextEditingController _controllerLastNum = TextEditingController();
  final TextEditingController _controllerFirstNum = TextEditingController();
  final FocusNode _focusNodeFirst = FocusNode();
  final FocusNode _focusNodeLast = FocusNode();

  @override
  void initState() {
    super.initState();
    _controllerFirstNum.text = (widget.phone == '') ? '+998' : widget.phone.substring(0, 5);
    _controllerLastNum.text = (widget.phone == '') ? '' : widget.phone.substring(5); // Исправлено: до конца строки
    _focusNodeFirst.addListener(_onFocusChanged);
    _focusNodeLast.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _controllerLastNum.dispose();
    _controllerFirstNum.dispose();
    _focusNodeFirst.removeListener(_onFocusChanged);
    _focusNodeFirst.dispose();
    _focusNodeLast.removeListener(_onFocusChanged);
    _focusNodeLast.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    if (!_focusNodeFirst.hasFocus && !_focusNodeLast.hasFocus) {
      final result = _controllerFirstNum.text + _controllerLastNum.text;
      if (result.isNotEmpty && CheckerPhone.isUzPhoneNumber(result)) {
        widget.onPhoneEntered(result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        ShowChangePhoneAlertDialogFunction.body(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: SizedBox(
          height: 40,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    controller: _controllerLastNum,
                    focusNode: _focusNodeLast,
                    decoration: decorationFirst,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 65,
                  child: TextField(
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    controller: _controllerFirstNum,
                    focusNode: _focusNodeFirst,
                    decoration: decorationLast,
                    style: const TextStyle(
                      color: Color.fromRGBO(16, 53, 91, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

var decorationFirst = InputDecoration(
  filled: true,
  fillColor: const Color.fromRGBO(245, 245, 247, 1),
  contentPadding: const EdgeInsets.only(
    top: 15,
    left: 30,
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
);

var decorationLast = InputDecoration(
  filled: true,
  fillColor: const Color.fromRGBO(245, 245, 247, 1),
  contentPadding: const EdgeInsets.only(
    top: 12,
    left: 12,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      color: Color.fromRGBO(16, 53, 91, 1),
      width: 1,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      color: Color.fromRGBO(16, 53, 91, 1),
      width: 1,
    ),
  ),
);