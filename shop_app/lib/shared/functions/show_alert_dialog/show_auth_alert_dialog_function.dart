import 'package:flutter/material.dart';
import 'package:project_z/config/theme/button_style_extension.dart';
import 'package:project_z/config/theme/text_styles_extension.dart';
import 'package:project_z/gen_locales/app_localizations.dart';

class ShowAuthAlertDialogFunction {
  static const contentTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: Color.fromRGBO(129, 129, 129, 1),
  );

  

  Future<bool?> call(BuildContext context) async {

    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {

        final theme = Theme.of(context);
        final scheme = theme.colorScheme;
        final textStyles = theme.extension<AppTextStyles>();
        final buttonStyles = theme.extension<AppButtonStyles>();
        final S = AppLocalizations.of(context);

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
                Text(S.authAlertDialogTitle, style: textStyles!.heading),
                const SizedBox(height: 10),
                Text(S.authAlertDialogContent, style: contentTextStyle, textAlign: TextAlign.center,),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        flex: 140,
                        child: ElevatedButton(
                          style: buttonStyles!.secondaryElevatedButton,
                          onPressed: () => Navigator.pop(context, false),
                          child: Text(S.authAlertDialogBackButton, style: TextStyle(color: scheme.primary)),
                        )),
                    const Expanded(flex: 10, child: SizedBox()),
                    Expanded(
                        flex: 140,
                        child: ElevatedButton(
                          style: buttonStyles.secondaryElevatedButton,
                          onPressed: () => Navigator.pop(context, true),
                          child: Text(S.authAlertDialogContinueButton, style: TextStyle(color: scheme.primary)),
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
