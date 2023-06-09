import 'package:flutter/material.dart';
import 'package:pasticceria/constants/constants.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    fontFamily: 'Gotham',
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: DefaultColors.primaryColor,
      background: Colors.white,
      onPrimary: Colors.white,
      secondary: DefaultColors.secondaryColor,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      onBackground: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black87,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: DefaultColors.primaryColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyles.appBarTitle,
      foregroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    iconTheme: const IconThemeData(color: DefaultColors.secondaryColor),
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: DefaultColors.primaryColor,
    ),
  );
}
