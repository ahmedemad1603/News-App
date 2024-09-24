import 'package:flutter/material.dart';

class AppStyle
{
  static Color lightPrimary = const Color(0xff39A552);
  static Color lightBlackText = const Color(0xff303030);
  static Color categoriesTitleColor = const Color(0xff4F5A69);
  static ThemeData lightTheme = ThemeData(
    iconTheme: const IconThemeData(
      color: Colors.white
    ),
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
        seedColor: lightPrimary,
        primary: lightPrimary,
        secondary: lightBlackText
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: lightPrimary,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50)
        )
      ),
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 22,
        color: Colors.white
      )
    ),
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: Colors.white
      ),
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 22,
        color: categoriesTitleColor
      ),
      titleSmall: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: Colors.white
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: lightPrimary
      ),
      bodySmall: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Color(0xff79828B)
      ),
      titleMedium: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: Color(0xff42505C)
      ),
      displaySmall: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 13,
        color: Color(0xffA3A3A3)
      )
    )
  );
}