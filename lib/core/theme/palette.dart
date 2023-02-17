import 'package:flutter/material.dart';

abstract class Palette {
  ///Primary color
  static const primaryColor1 = Color(0XFF34C6DA);
  static const primaryColor2 = Color(0XFF0B6356);
  static final primaryColor6 = primaryColor1.withOpacity(0.5);

  ///Secondary color
  static const secondaryColor1 = Color(0XFF34da48);
  static const secondaryColor2 = Color(0XFF34da48);

  ///Third color
  static const thirdColor9 = Color(0XFFFFF6E9);
  static const thirdColor10 = Color(0xFFE9EFF3);

  ///Text colors
  static const black1 = Colors.black;
  static const black2 = Color(0XFF474747);
  static const black3 = Color(0XFF333333);

  ///Input fields
  static const inputFieldHint = Color(0xFF5C5C5c);
  static const whiteText = Colors.white;

  ///General backgrounds
  static const backgroundColor = Colors.white;
  static final taskBackground = primaryColor1.withOpacity(0.35);

  ///Dividera
  static const dividerColor = Color(0XFFD7D7D7);

  ///Buttons border & background colors
  static const buttonBorder = Color(0XFFE5E5E5);
  static const inputFieldColor = Color(0XFFF5F5F5);

  ///Feedback colors
  static const errorColor = Color(0xFFE52030);
  static const successColor = Color(0xFF40DD7F);

  ///General screen background gradients
  static const backgroundGradient1 = Color(0xFF9055FF);
  static const backgroundGradient2 = Color(0xFF13E2DA);
}
