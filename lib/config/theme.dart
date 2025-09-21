import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryBlue = Color.fromRGBO(66, 176, 244, 1);
  static const Color primaryWhite = Colors.white;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        brightness: Brightness.light,
        primary: primaryBlue,
        surface: primaryWhite,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontFamily: "poppins"),
        bodyMedium: TextStyle(fontFamily: "poppins"),
        displayLarge: TextStyle(fontFamily: "poppins"),
        displayMedium: TextStyle(fontFamily: "poppins"),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryWhite,
        foregroundColor: primaryBlue,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: primaryWhite,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryBlue,
        foregroundColor: primaryWhite,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        brightness: Brightness.dark,
        primary: primaryBlue,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontFamily: "poppins"),
        bodyMedium: TextStyle(fontFamily: "poppins"),
        displayLarge: TextStyle(fontFamily: "poppins"),
        displayMedium: TextStyle(fontFamily: "poppins"),
      ),
    );
  }
}