import 'package:flutter/material.dart';
import 'package:project_z/config/theme/colors.dart';

class AppButtonStyles extends ThemeExtension<AppButtonStyles> {
  final ButtonStyle? primaryElevatedButton;
  final ButtonStyle? smallElevatedButton;
  final ButtonStyle? outlinedElevatedButton;
  final ButtonStyle? secondaryElevatedButton;

  const AppButtonStyles({
    this.outlinedElevatedButton,
    this.primaryElevatedButton,
    this.smallElevatedButton,
    this.secondaryElevatedButton
  });

  @override
  AppButtonStyles copyWith({
    ButtonStyle? primaryElevatedButton,
    ButtonStyle? smallElevatedButton,
    ButtonStyle? outlinedElevatedButton,
    ButtonStyle? secondaryElevatedButton
  }) {
    return AppButtonStyles(
      primaryElevatedButton: primaryElevatedButton ?? this.primaryElevatedButton,
      smallElevatedButton: smallElevatedButton ?? this.smallElevatedButton,
      outlinedElevatedButton: outlinedElevatedButton ?? this.outlinedElevatedButton,
      secondaryElevatedButton: secondaryElevatedButton ?? this.secondaryElevatedButton
    );
  }

  @override
  AppButtonStyles lerp(ThemeExtension<AppButtonStyles>? other, double t) {
    if (other is! AppButtonStyles) {
      return this;
    }
    return AppButtonStyles(
      primaryElevatedButton: ButtonStyle.lerp(primaryElevatedButton, other.primaryElevatedButton, t),
      smallElevatedButton: ButtonStyle.lerp(smallElevatedButton, other.smallElevatedButton, t),
      outlinedElevatedButton: ButtonStyle.lerp(outlinedElevatedButton, other.outlinedElevatedButton, t),
      secondaryElevatedButton: ButtonStyle.lerp(secondaryElevatedButton, other.secondaryElevatedButton, t)
    );
  }

  static ButtonStyle get defaultPrimaryElevatedButton => ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        shadowColor: Colors.transparent,
      );

  static ButtonStyle get defaultSmallElevatedButton => ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
        shadowColor: Colors.transparent,
      );

  static ButtonStyle get defaultOutlinedElevatedButton => ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        backgroundColor: const Color.fromRGBO(245, 245, 247, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: AppColors.primary, 
            width: 1, 
          ),
        ),
        textStyle: const TextStyle(
          fontSize: 12,
          color: AppColors.primary,
          fontWeight: FontWeight.w700,
        ),
        shadowColor: Colors.transparent,
      );

  static ButtonStyle get defaultSecondaryElevatedButton => ElevatedButton.styleFrom(
    elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        shadowColor: Colors.transparent,
  );


  static ButtonStyle get defaultPrimaryDialogButton => ElevatedButton.styleFrom(
    elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        shadowColor: Colors.transparent,
  );
}