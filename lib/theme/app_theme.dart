import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF2E3A59);
  static const Color accentColor = Color(0xFF3366FF);
  static const Color backgroundColor = Color(0xFF1A1F33);
  static const Color cardColor = Color(0xFF252B42);
  static const Color textColor = Colors.white;
  static const Color secondaryTextColor = Colors.white70;
  
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 234, 237, 244),
      elevation: 0,
    ),
    cardTheme: const CardTheme(
      color: cardColor,
      elevation: 2,
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      backgroundColor: cardColor,
      collapsedBackgroundColor: cardColor,
      textColor: textColor,
      collapsedTextColor: textColor,
      iconColor: textColor,
      collapsedIconColor: textColor,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: textColor),
      bodyMedium: TextStyle(color: textColor),
      titleMedium: TextStyle(color: textColor),
      titleSmall: TextStyle(color: secondaryTextColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: cardColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      labelStyle: const TextStyle(color: secondaryTextColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accentColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}