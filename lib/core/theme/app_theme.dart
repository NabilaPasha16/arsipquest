import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get light {
    final base = ThemeData(useMaterial3: true);
    // Use Montserrat as the primary UI/body font and Cormorant Garamond for headings.
    final montserrat = GoogleFonts.montserratTextTheme(base.textTheme);
    final textTheme = montserrat.copyWith(
      displayLarge: GoogleFonts.cormorantGaramond(
        fontSize: 56,
        fontWeight: FontWeight.w700,
        color: AppColors.darkBrown,
        height: 1.05,
      ),
      displayMedium: GoogleFonts.cormorantGaramond(
        fontSize: 40,
        fontWeight: FontWeight.w600,
        color: AppColors.darkBrown,
        height: 1.08,
      ),
      displaySmall: GoogleFonts.cormorantGaramond(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: AppColors.accentRed,
        height: 1.08,
      ),
      headlineMedium: GoogleFonts.cormorantGaramond(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: AppColors.darkBrown,
        height: 1.06,
      ),
      titleLarge: GoogleFonts.cormorantGaramond(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.darkBrown,
        height: 1.06,
      ),
      titleMedium: GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.darkBrown,
        height: 1.2,
      ),
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 16,
        color: AppColors.navy,
        height: 1.6,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14,
        color: AppColors.navy,
        height: 1.6,
      ),
      labelLarge: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.parchment,
      ),
    );

    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.bistre,
        primary: AppColors.bistre,
        secondary: AppColors.lion,
        surface: AppColors.ivory,
        surfaceContainerHighest: AppColors.ivory,
        onPrimary: AppColors.ivory,
        onSecondary: AppColors.bistre,
      ),
      scaffoldBackgroundColor: AppColors.ivory,
      canvasColor: AppColors.ivory,
      cardColor: AppColors.dun,
      textTheme: textTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.navy,
          foregroundColor: AppColors.parchment,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 8,
          shadowColor: AppColors.shadow,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          textStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.darkBrown,
          textStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
