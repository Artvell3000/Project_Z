import 'package:flutter/material.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles> {
  final TextStyle? caption;
  final TextStyle? heading;
  final TextStyle? description;
  final TextStyle? label;
  final TextStyle? textField;
  final TextStyle? elevationButton;

  const AppTextStyles({
    this.caption,
    this.heading,
    this.description,
    this.label,
    this.textField,
    this.elevationButton
  });

  @override
  AppTextStyles copyWith({
    TextStyle? caption,
    TextStyle? heading,
    TextStyle? description,
    TextStyle? label,
    TextStyle? textField,
    TextStyle? elevationButton
  }) {
    return AppTextStyles(
      caption: caption ?? this.caption,
      heading: heading ?? this.heading,
      description: description ?? this.description,
      label: label ?? this.label,
      textField: textField ?? this.textField,
      elevationButton: elevationButton ?? this.elevationButton
    );
  }

  @override
  AppTextStyles lerp(ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) {
      return this;
    }
    return AppTextStyles(
      caption: TextStyle.lerp(caption, other.caption, t),
      heading: TextStyle.lerp(heading, other.heading, t),
      description: TextStyle.lerp(description, other.description, t),
      label: TextStyle.lerp(label, other.label, t),
      textField: TextStyle.lerp(textField, other.textField, t),
      elevationButton: TextStyle.lerp(elevationButton, other.elevationButton, t),
    );
  }

  // Стиль для описания TextField
  static TextStyle get defaultLabel => const TextStyle(
    color: Color.fromRGBO(125,125,125,1),
    fontWeight: FontWeight.w500,
    fontSize: 12
  );

  // Стиль для поясняющих надписей
  static TextStyle get defaultCaption => const TextStyle(
        color: Color.fromRGBO(129, 129, 129, 1),
        fontWeight: FontWeight.w500,
        fontSize: 12,
      );

  // Стиль для заголовков
  static TextStyle get defaultHeading => const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );

  // Стиль для описаний (например, товаров)
  static TextStyle get defaultDescription => const TextStyle(
        color: Color.fromRGBO(97, 97, 97, 1),
        fontWeight: FontWeight.w400,
        fontSize: 10,
      );

  // Стиль для текстовых полей
  static TextStyle get defaultTextField => const TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  // Стиль для кнопок с elevation
  static TextStyle get defaultElevationButton => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white
  );
}