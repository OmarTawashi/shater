import 'package:flutter/material.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/font_style.dart';

class ThemeApp {
  //material theme
  static ThemeData materialLightTheme({Color color = COLORS.primaryColor}) => ThemeData(
        fontFamily: FontStyleConstant.familyFont,
        primaryColor: color,
        brightness: Brightness.light,
        hintColor: COLORS.hintColor,
        useMaterial3: true,
        scaffoldBackgroundColor: COLORS.secanderyColor,
        canvasColor: COLORS.canvasColor,
        cardColor: COLORS.cardColor,
        colorScheme: ColorScheme.light(
          primary: color,
          secondary: color,
        ),
        chipTheme: ChipThemeData(color: WidgetStatePropertyAll(Colors.white)),
        textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom()),
      );
}
