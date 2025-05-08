import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF28BBBC); // Teal-Blue (Your primary)
  static const Color background = Color(0xFF111111); // Dark background
  static const Color blackShade = Color(0xFF0B161F); // Deep blackish-blue shade

  static const Color accent = Color(0xFF6B4FA1); // Muted Purple (optional)
  static const Color success = Color(0xFF6BBF59); // Soft Green
  static const Color warning = Color(0xFFE6B800); // Warm Gold
  static const Color white = Colors.white;
  static const Color white54 = Colors.white54;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color grey2 = Color(0xFF28262D);
  static const Color borderColor = Color(0xFF363739);

  Color get shadowColor => Colors.black.withValues(alpha: 0.05);

  static MaterialColor primarySwatch = const MaterialColor(
    0xFF28BBBC,
    <int, Color>{
      50: Color(0xFFE0F7F7),
      100: Color(0xFFB3EBEB),
      200: Color(0xFF80DEDE),
      300: Color(0xFF4DD2D2),
      400: Color(0xFF26C7C7),
      500: Color(0xFF28BBBC), // Primary
      600: Color(0xFF23A8A9),
      700: Color(0xFF1E9495),
      800: Color(0xFF197F80),
      900: Color(0xFF136A6B),
    },
  );
}
