import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:project_z/features/shell_widget/presentation/bloc/auth/auth_screen_bloc.dart';
import 'package:project_z/shared/consts/text_field_style.dart';
import 'package:project_z/shared/consts/text_style_for_elevation_button.dart';
import 'package:project_z/shared/consts/text_style_title.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthAddDataWidget extends StatefulWidget {
  const AuthAddDataWidget(
      {super.key, required this.initPhone, required this.initFullName, required this.onClickButtonWhenEnteredData});

  final String initPhone, initFullName;
  final void Function(String name, String phone) onClickButtonWhenEnteredData;

  @override
  State<AuthAddDataWidget> createState() => _AuthAddDataWidgetState();
}

class _AuthAddDataWidgetState extends State<AuthAddDataWidget> {
  final _controllerFullName = TextEditingController();
  final _controllerPhone = TextEditingController();

  bool isUzbekPhoneNumber(String phone) {
    final RegExp regExp = RegExp(r'^\+998\s\(\d{2}\)\s\d{3}\s\d{2}\s\d{2}$');
    return regExp.hasMatch(phone);
  }

  @override
  void dispose() {
    _controllerPhone.dispose();
    _controllerFullName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Telefon raqamingizni kiriting", style: titleTextStyle),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: IconButton(
                  icon: const Icon(Icons.close_rounded, size: 30, color: Color.fromRGBO(16, 53, 91, 1)),
                  onPressed: () {
                    BlocProvider.of<AuthScreenBloc>(context).add(const AuthScreenEvent.hide(false));
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text('Ism va familiya', style: textStyleForLabel),
                  TextField(
                    // onEditingComplete: () {
                    //   isFullNameEntered = _controllerFullName.text.length > 5;
                    // },
                    controller: _controllerFullName..text = widget.initFullName,
                    style: textStyleForTextFieldStyle,
                    decoration: textFieldDecoration,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text('Telefon', style: textStyleForLabel),
                  TextField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [phoneMask],
                    // onEditingComplete: () {
                    //   isPhoneEntered = (_controllerPhone.text.length == 19);
                    // },
                    controller: _controllerPhone..text = widget.initPhone,
                    style: textStyleForTextFieldStyle,
                    decoration: textFieldDecoration,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: ElevatedButton(
                        onPressed: () {
                          Logger().i('[_controllerFullName.text] ${_controllerFullName.text}');
                          Logger().i('[_controllerPhone.text] ${_controllerPhone.text}');

                          if (_controllerFullName.text.length > 5 && isUzbekPhoneNumber(_controllerPhone.text)) {
                            widget.onClickButtonWhenEnteredData(
                              _controllerFullName.text,
                              _controllerPhone.text,
                            );
                          }
                        },
                        child: const Center(child: Text('Ro\'yxatdan o\'tish', style: textStyleForElevationButton))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Center(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Akkauntingiz yo'q? ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color.fromRGBO(129, 129, 129, 1),
                              ),
                            ),
                            TextSpan(
                              text: "Avtorizatsiyadan o'tish",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color.fromRGBO(16, 53, 91, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

final phoneMask = MaskTextInputFormatter(
  mask: '+998 (##) ### ## ##',
  filter: {"#": RegExp(r'[0-9]')},
);
