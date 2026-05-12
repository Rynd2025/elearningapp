import 'package:flutter/material.dart';

class AppTheme {
  static const _primaryColor = Color(0xFF6200EE); // Violet professionnel
  static const _backgroundColor = Color(0xFFF5F5F5);

  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: _backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: _primaryColor,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
      ),
    ),
  );
}
