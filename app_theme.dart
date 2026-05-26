import 'package:flutter/material.dart';

class AppTheme {
  static const Color forest = Color(0xFF0A2E1A);
  static const Color moss = Color(0xFF1A4A2E);
  static const Color leaf = Color(0xFF2D7A4F);
  static const Color lime = Color(0xFF5EC97E);
  static const Color glow = Color(0xFFA8F5C0);
  static const Color dark = Color(0xFF080F0A);
  static const Color danger = Color(0xFFE84040);
  static const Color safe = Color(0xFF38D68A);
  static const Color water = Color(0xFF3AB8D8);
  static const Color storm = Color(0xFF8855DD);

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: dark,
    colorScheme: const ColorScheme.dark(
      primary: lime,
      secondary: leaf,
      error: danger,
    ),
    fontFamily: 'DM Sans',
    appBarTheme: const AppBarTheme(
      backgroundColor: forest,
      elevation: 0,
    ),
  );
}
