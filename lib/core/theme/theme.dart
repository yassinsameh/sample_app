import 'package:flutter/material.dart';
import 'package:innoscripta_demo/core/theme/palette.dart';

class AppThemeData {
  static final themeData = ThemeData(
      primaryColor: Palette.primaryColor1,
      fontFamily: "Graphie",
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.w700, fontFamily: "Graphie"),
        titleMedium: TextStyle(
            fontSize: 16.0,
            color: Palette.black1,
            fontWeight: FontWeight.w500,
            fontFamily: "Graphie"),
        titleSmall: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w300, fontFamily: "Graphie"),
        bodyLarge: TextStyle(
            fontSize: 16.0,
            color: Palette.black1,
            fontWeight: FontWeight.w400,
            fontFamily: "Graphie"),
        bodyMedium: TextStyle(
            fontSize: 14.0,
            color: Palette.black1,
            fontWeight: FontWeight.w400,
            fontFamily: "Graphie"),
        bodySmall: TextStyle(
            fontSize: 13.0, fontWeight: FontWeight.w500, fontFamily: "Graphie"),
        displayLarge: TextStyle(
            fontSize: 26.0,
            color: Palette.primaryColor1,
            fontWeight: FontWeight.w900,
            fontFamily: "Graphie"),
        displayMedium: TextStyle(
            fontSize: 24.0,
            color: Palette.primaryColor1,
            fontWeight: FontWeight.w800,
            fontFamily: "Graphie"),
        displaySmall: TextStyle(
            fontSize: 20.0,
            color: Palette.primaryColor1,
            fontWeight: FontWeight.w700,
            fontFamily: "Graphie"),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Palette.primaryColor1,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: Palette.primaryColor1, // color for text

        overlayColor: MaterialStateProperty.all(
          Palette.primaryColor1,
        ),
      ),
      scaffoldBackgroundColor: Palette.backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Palette.backgroundColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: Palette.primaryColor1),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Palette.primaryColor1, width: 1)),
      ));
  // //Used when validating in the background
  static const TextStyle hiddenErrorTextStyle =
      TextStyle(color: Colors.transparent, fontSize: 1, height: 0.01);
  static const visibleErrorTextStyle = TextStyle(
      color: Palette.errorColor,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.5);
}
