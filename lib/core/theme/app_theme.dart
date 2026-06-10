import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.yellow,
    fontFamily: 'GoogleSansFlex',
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.brown,
      primary: AppColors.brown,
      secondary: AppColors.yellow,
      surface: AppColors.white,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.darkBrown,
      ),
    ),
  );
}