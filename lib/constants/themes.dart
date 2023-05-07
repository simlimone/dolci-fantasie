import 'package:flutter/material.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.white,
      background: Color(0xff1F1B24),
      onPrimary: Colors.black87,
      secondary: Colors.pinkAccent,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      onBackground: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black87,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 25, 22, 29),
      elevation: 5,
      centerTitle: true,
      foregroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: const Color(0xff1F1B24),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff1F1B24),
    ),
  );
}
