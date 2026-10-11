import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_styles.dart';

abstract final class AppThemes {
  static ThemeData get light {
    final textTheme = ThemeData.light().textTheme.apply(
      bodyColor: AppColors.textPrimary,
      displayColor: AppColors.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        surface: AppColors.background,
        onSurface: AppColors.textPrimary,
      ),
      scaffoldBackgroundColor: AppColors.background,
      textTheme: textTheme.copyWith(
        headlineLarge: AppStyles.heading(textTheme),
        titleMedium: AppStyles.body(textTheme),
        bodyLarge: AppStyles.body(textTheme),
        bodyMedium: AppStyles.body(textTheme),
        bodySmall: AppStyles.caption(textTheme),
        labelLarge: AppStyles.button(textTheme),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.fieldPadding,
          vertical: AppSpacing.fieldVerticalPadding,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.fieldRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.fieldRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.fieldRadius),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        hintStyle: textTheme.bodyLarge?.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          textStyle: AppStyles.button(textTheme),
          minimumSize: const Size.fromHeight(AppSpacing.buttonHeight),
          shape: const StadiumBorder(),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.textPrimary),
      ),
    );
  }
}
