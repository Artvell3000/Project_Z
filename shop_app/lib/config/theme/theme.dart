import 'package:flutter/material.dart';
import 'package:project_z/config/theme/button_style_extension.dart';
import 'package:project_z/config/theme/colors.dart';
import 'package:project_z/config/theme/text_styles_extension.dart';

const ColorScheme _scheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.primary,
  onPrimary: AppColors.onPrimary,
  secondary: AppColors.secondary,
  onSecondary: AppColors.onSecondary,
  error: AppColors.error,
  onError: AppColors.onError,
  surface: AppColors.surface,
  onSurface: AppColors.onSurface,
);

const _borderCircularForInput = 12.0;

final onlineShopTheme = ThemeData(
  fontFamily: 'Neometric',
  colorScheme: _scheme,
  extensions: [
    AppButtonStyles(
      outlinedElevatedButton: AppButtonStyles.defaultOutlinedElevatedButton,
      primaryElevatedButton: AppButtonStyles.defaultPrimaryElevatedButton,
      smallElevatedButton: AppButtonStyles.defaultSmallElevatedButton,
      secondaryElevatedButton: AppButtonStyles.defaultSecondaryElevatedButton
    ),
    AppTextStyles(
      caption: AppTextStyles.defaultCaption,
      heading: AppTextStyles.defaultHeading,
      description: AppTextStyles.defaultDescription,
      label: AppTextStyles.defaultLabel
    )
  ],
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color.fromRGBO(245, 245, 247, 1),
    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color.fromRGBO(197, 197, 197, 1),
        width: 1,
      ),
      borderRadius: BorderRadius.circular(_borderCircularForInput),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color.fromRGBO(197, 197, 197, 1),
        width: 1,
      ),
      borderRadius: BorderRadius.circular(_borderCircularForInput),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color.fromRGBO(197, 197, 197, 1),
        width: 1,
      ),
      borderRadius: BorderRadius.circular(_borderCircularForInput),
    ),
    hintStyle: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
  ),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
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
    ),
  ),
);



