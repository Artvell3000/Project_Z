import 'package:flutter/material.dart';
import 'package:project_z/l10n/app_localizations.dart';
import 'package:project_z/shared/consts/colors.dart';
import 'package:project_z/shared/consts/grey_elevated_button_style.dart';
import 'package:project_z/shared/consts/text_style_title.dart';

class ShowAuthAlertDialogFunction {
  static const contentTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: Color.fromRGBO(129, 129, 129, 1),
  );

  static Future<bool?> body(BuildContext context) async {
    return await showDialog<bool>(
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
                Text(AppLocalizations.of(context)!.authAlertDialogTitle, style: titleTextStyle),
                const SizedBox(height: 10),
                Text(AppLocalizations.of(context)!.authAlertDialogContent, style: contentTextStyle, textAlign: TextAlign.center,),
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
                    const Expanded(flex: 10, child: SizedBox()),
                    Expanded(
                        flex: 140,
                        child: ElevatedButton(
                          style: greyButtonStyle,
                          onPressed: () => Navigator.pop(context, true),
                          child: Text(AppLocalizations.of(context)!.authAlertDialogContinueButton, style: const TextStyle(color: mainColor)),
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
