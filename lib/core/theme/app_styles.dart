import 'package:flutter/material.dart';

import 'app_spacing.dart';

abstract final class AppStyles {
  static TextStyle heading(TextTheme theme) =>
      (theme.headlineLarge ?? const TextStyle()).copyWith(
        fontSize: AppSpacing.headingSize,
        fontWeight: FontWeight.w700,
        height: AppSpacing.headingLineHeight,
        letterSpacing: AppSpacing.headingLetterSpacing,
      );

  static TextStyle body(TextTheme theme) =>
      (theme.bodyLarge ?? const TextStyle()).copyWith(
        fontSize: AppSpacing.bodySize,
        height: AppSpacing.bodyLineHeight,
      );

  static TextStyle button(TextTheme theme) =>
      (theme.labelLarge ?? const TextStyle()).copyWith(
        fontSize: AppSpacing.buttonTextSize,
        fontWeight: FontWeight.w500,
      );

  static TextStyle caption(TextTheme theme) =>
      (theme.bodySmall ?? const TextStyle()).copyWith(
        fontSize: AppSpacing.captionSize,
      );

  static TextStyle onboardingHeading(TextTheme theme) =>
      (theme.headlineMedium ?? const TextStyle()).copyWith(
        fontSize: AppSpacing.onboardingHeadingSize,
        fontWeight: FontWeight.w700,
      );
}
