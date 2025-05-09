import 'package:flutter/material.dart';
import 'package:flutter_starter_template/values/colors.dart';

abstract class Styles {
  static const _coiny = 'Coiny';

  static const TextStyle errorTextStyleRed = TextStyle(
    fontFamily: _coiny,
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    height: 14.0 / 10.0,
    color: ThemeColors.darkRed,
  );

  static const TextStyle errorTextStyleWhite = TextStyle(
    fontFamily: _coiny,
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    height: 14.0 / 10.0,
    color: ThemeColors.white,
  );

  static const TextStyle h6HeadingWhite = TextStyle(
    fontFamily: _coiny,
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: ThemeColors.white,
    // height: 14.0 / 14.0,
  );

  static const TextStyle h6HeadingBlack = TextStyle(
    fontFamily: _coiny,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: ThemeColors.black,
    height: 16.0 / 14.0,
  );

  static const TextStyle inputLabelStyle = TextStyle(
    fontFamily: _coiny,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: ThemeColors.white,
  );

  static const TextStyle buttonTextLabelStyle = TextStyle(
    fontFamily: _coiny,
    fontSize: 30.0,
    fontWeight: FontWeight.w400,
    color: ThemeColors.white,
    height: 16.0 / 14.0,
  );

  static const TextStyle chooseCharacterHeaderTitle = TextStyle(
    fontFamily: _coiny,
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: ThemeColors.primaryAccent, // Stroke color
    shadows: [
      Shadow(
        blurRadius: 0.2,
        color: ThemeColors.primaryColor,
        offset: Offset(1, 1), // Adjust this offset to control the stroke width
      ),
    ],
  );
}
