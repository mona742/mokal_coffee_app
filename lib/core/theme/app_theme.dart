import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryEspresso = Color(0xFF3B231A);
  static const Color backgroundWarmCream = Color(0xFFFAF5EE);
  static const Color accentNeonGold = Color(0xFFE0A94B);
  static const Color cardSurface = Colors.white;
  static const Color textMuted = Color(0xFF8C7A6B);
}

class AppTheme {
  static const double defaultBorderRadius = 16.0;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.backgroundWarmCream,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryEspresso,
        primary: AppColors.primaryEspresso,
        secondary: AppColors.accentNeonGold,
        surface: AppColors.cardSurface,
      ),
      fontFamily: GoogleFonts.tajawal().fontFamily,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundWarmCream,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryEspresso),
        titleTextStyle: TextStyle(
          color: AppColors.primaryEspresso,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.cardSurface,
        elevation: 2,
        shadowColor: AppColors.primaryEspresso.withOpacity(0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentNeonGold,
          foregroundColor: AppColors.primaryEspresso,
          elevation: 0,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
          ),
        ),
      ),
    );
  }
}
