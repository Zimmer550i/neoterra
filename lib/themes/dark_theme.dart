import 'package:flutter/material.dart';
import 'package:neoterra/utils/app_colors.dart';

ThemeData dark() => ThemeData(
  fontFamily: "Inter",
  scaffoldBackgroundColor: AppColors.charcoal,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.secondaryBg,
  ),
);
