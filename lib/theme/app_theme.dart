import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF3B7A3B);
  static const Color primaryDark = Color(0xFF2D5E2D);
  static const Color primaryLight = Color(0xFF4E8B4E);
  static const Color white = Colors.white;
  static const Color whiteMuted = Color(0xCCFFFFFF);
  static const Color cardBg = Colors.white;
  static const Color textDark = Color(0xFF212121);
  static const Color textMuted = Color(0xFF757575);
}

class AppTheme {
  static ThemeData get theme => ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.primary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.white),
          titleTextStyle: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: AppColors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryDark,
            foregroundColor: AppColors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            padding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            textStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      );
}
