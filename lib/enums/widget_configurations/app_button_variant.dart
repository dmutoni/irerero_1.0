import 'package:flutter/material.dart';
import 'package:flutter_starter_template/values/colors.dart';

enum AppButtonVariant { dark, light }

extension AppButtonVariantContent on AppButtonVariant {
  Color get textColor {
    switch (this) {
      case AppButtonVariant.dark:
        return ThemeColors.white;
      case AppButtonVariant.light:
        return ThemeColors.black;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case AppButtonVariant.dark:
        return ThemeColors.primaryColor;
      case AppButtonVariant.light:
        return ThemeColors.lightGrey;
    }
  }

  Color get disabledTextColor {
    switch (this) {
      case AppButtonVariant.dark:
        return ThemeColors.white;
      case AppButtonVariant.light:
        return ThemeColors.black;
    }
  }

  Color get disabledBackgroundColor {
    switch (this) {
      case AppButtonVariant.dark:
        return ThemeColors.lightGrey;
      case AppButtonVariant.light:
        return ThemeColors.lightGrey;
    }
  }

  Color get borderColor {
    switch (this) {
      case AppButtonVariant.dark:
        return Colors.transparent;
      case AppButtonVariant.light:
        return ThemeColors.grey;
    }
  }
}
