import 'package:flutter/material.dart';
import 'color_code.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.primaryRed,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryRed,
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.secondaryBlue,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBackground,
      selectedItemColor: AppColors.primaryRed,
      unselectedItemColor: AppColors.neutralGrey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryRed,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkBlack, fontSize: 16),
      titleLarge: TextStyle(color: AppColors.primaryRed, fontWeight: FontWeight.bold),
    ),
  );
}
