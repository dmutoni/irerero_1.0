import 'package:flutter/material.dart';

abstract class ThemeColors {
  static const primaryColor = Color(0xFFFFA500);
  static const primaryAccent = Color(0xFFFFD700);
  static const black = Color(0xFF000000);
  static const red = Color(0xFFE53935);
  static const darkGreen = Color(0xFF1d7895);
  static const darkGrey = Color(0xFFefefef);
  static const white = Color(0xFFFFFFFF);
  static const lightGrey = Color(0xFFf5f5f5);
  static const darkRed = Color(0xFFe53935);
  static const orangePrimaryColor = Color(0xFFFFA500);
  static const green = Color(0xFF8FCB85);
  static const grey = Color(0xFFB8BDC0);
  static const blue = Color(0xFF2364E1);
  static const greenBackground = Color(0xFFABC300);
}

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? accentColor;
  final Color? successColor;
  final Color? errorColor;
  final Color? iconColor;
  final Color? secondaryTextColor;

  const AppColors({
    this.primaryColor,
    this.secondaryColor,
    this.backgroundColor,
    this.textColor,
    this.accentColor,
    this.successColor,
    this.errorColor,
    this.iconColor,
    this.secondaryTextColor,
  });

  @override
  AppColors copyWith({
    final Color? primaryColor,
    final Color? secondaryColor,
    final Color? backgroundColor,
    final Color? textColor,
    final Color? accentColor,
    final Color? successColor,
    final Color? errorColor,
    final Color? iconColor,
    final Color? secondaryTextColor,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      accentColor: accentColor ?? this.accentColor,
      successColor: successColor ?? this.successColor,
      errorColor: errorColor ?? this.errorColor,
      iconColor: iconColor ?? this.iconColor,
      secondaryTextColor: secondaryColor ?? this.secondaryColor,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
      accentColor: Color.lerp(accentColor, other.accentColor, t),
      successColor: Color.lerp(successColor, other.successColor, t),
      errorColor: Color.lerp(errorColor, other.errorColor, t),
      iconColor: Color.lerp(iconColor, other.iconColor, t),
      secondaryTextColor: (Color.lerp(
        iconColor,
        other.iconColor,
        t,
      )),
    );
  }
}
