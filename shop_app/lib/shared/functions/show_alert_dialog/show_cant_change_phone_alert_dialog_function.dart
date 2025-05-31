import 'package:flutter/material.dart';
import 'package:project_z/l10n/app_localizations.dart';
import 'package:project_z/shared/consts/colors.dart';
import 'package:project_z/shared/consts/grey_elevated_button_style.dart';
import 'package:project_z/shared/consts/text_style_title.dart';

class ShowChangePhoneAlertDialogFunction {
  static const contentTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: Color.fromRGBO(129, 129, 129, 1),
  );

  static Future<void> body(BuildContext context) async {
    await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.changePhoneAlertDialogTitle, style: titleTextStyle),
                const SizedBox(height: 10),
                Text(AppLocalizations.of(context)!.changePhoneAlertDialogContent, style: contentTextStyle, textAlign: TextAlign.center,),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        flex: 140,
                        child: ElevatedButton(
                          style: greyButtonStyle,
                          onPressed: () => Navigator.pop(context, false),
                          child: Text(AppLocalizations.of(context)!.authAlertDialogBackButton, style: const TextStyle(color: mainColor)),
                        )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}