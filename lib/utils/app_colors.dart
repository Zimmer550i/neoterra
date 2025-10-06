import 'package:flutter/material.dart';

class AppColors {
  static Color mint = Color(0xff3F9E9D);
  static Color coral = Color(0xffE17A63);
  static Color charcoal = Color(0xff0E0E12);
  static Color card = Color(0xff282830);
  static Color secondaryText = Color(0xffC4C4C4);

  static MaterialColor cyan = MaterialColor(
    0xFF40EDFB, // primary color (500)
    <int, Color>{
      25: Color(0xFFF2EFFF),
      50: Color(0xFFECFDFF),
      100: Color(0xFFC4F9FE),
      200: Color(0xFFA7F7FD),
      300: Color(0xFF7FF3FC),
      400: Color(0xFF66F1FC),
      500: Color(0xFF40EDFB),
      600: Color(0xFF3AD8E4),
      700: Color(0xFF2DABB2),
      800: Color(0xFF23828A),
      900: Color(0xFF1B6469),
    },
  );

  // Gray MaterialColor
  static MaterialColor gray = MaterialColor(
    0xFF4B5563, // primary color (500)
    <int, Color>{
      25: Color(0xFFF9FAFB),
      50: Color(0xFFF3F4F6),
      100: Color(0xFFE5E7EB),
      200: Color(0xFFD1D5DB),
      300: Color(0xFF9CA3AF),
      400: Color(0xFF6B7280),
      500: Color(0xFF4B5563),
      600: Color(0xFF374151),
      700: Color(0xFF1F2937),
      800: Color(0xFF111827),
      900: Color(0xFF030712),
    },
  );

  static MaterialColor white = MaterialColor(0xffffffff, {
    50: Color(0xffffffff),
    100: Color(0xffffffff),
    200: Color(0xffffffff),
    300: Color(0xffffffff),
    400: Color(0xffffffff),
    500: Color(0xffffffff),
    600: Color(0xffe8e8e8),
    700: Color(0xffb5b5b5),
    800: Color(0xff8c8c8c),
    900: Color(0xff6b6b6b),
  });

  static Color red = Color(0xfff00000);
}
