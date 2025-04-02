import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:project_z/features/shell_widget/widgets/pin_code_input_row.dart';
import 'package:project_z/shared/consts/text_field_style.dart';
import 'package:project_z/shared/consts/text_style_for_elevation_button.dart';
import 'package:project_z/shared/consts/text_style_title.dart';

class AuthVerifyCodeWidget extends StatefulWidget {
  const AuthVerifyCodeWidget({super.key, required this.onClickSendWhenEnteredCode});
  final void Function(String code) onClickSendWhenEnteredCode;

  @override
  State<AuthVerifyCodeWidget> createState() => _AuthVerifyCodeWidgetState();
}

class _AuthVerifyCodeWidgetState extends State<AuthVerifyCodeWidget> {
  String inputCode = '';


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FractionalTranslation(
                translation: const Offset(-0.1, 0),
                child: TextButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(const AuthEvent.startAuth());
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.chevron_left_outlined,
                        color: Colors.black,
                        size: 36,
                      ),
                      SizedBox(width: 1),
                      Text(
                        'Kodni kiriting',
                        style: titleTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close_rounded,
                    size: 30, color: Color.fromRGBO(16, 53, 91, 1)),
                onPressed: () => BlocProvider.of<AuthBloc>(context).add(const AuthEvent.hide()),
              ),
            ],
          ),

          //todo
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Telefonni tasdiqlash uchun \nCompanyBot 6 xonali kod yuborildi',
                style: textStyleForLabel,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: PinCodeInputRow(
              toVerify: (code) {
                inputCode = code;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(
                  color:
                  Color.fromRGBO(197, 197, 197, 1),
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {
                // Действие при нажатии
              },
              child: const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Telegram Bot',
                    style: TextStyle(
                      color: Color.fromRGBO(16, 53, 91, 1),
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(12),
                ),
                padding:
                EdgeInsets.zero,
              ),
              onPressed: () {
                if(inputCode.length == 6)widget.onClickSendWhenEnteredCode(inputCode);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: const Center(
                  child: Text(
                    'Ro\'yxatdan o\'tish',
                    style: textStyleForElevationButton,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12),
            child: Center(
              child: Text(
                'Agar kod kelmasa, siz 120 soniya orqali\nangisini olishingiz mumkin',
                textAlign: TextAlign.center,
                style: textStyleForLabel,
              ),
            ),
          )
        ],
      ),
    );
  }
}
