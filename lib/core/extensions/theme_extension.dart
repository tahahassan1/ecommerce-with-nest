import 'package:flutter/material.dart';

/// Convenience accessors for the active app theme from a [BuildContext].
extension AppThemeExtension on BuildContext {
  /// The active Material theme.
  ThemeData get theme => Theme.of(this);

  /// The color scheme configured for the active theme.
  ColorScheme get colorScheme => theme.colorScheme;

  /// The text theme configured for the active theme.
  TextTheme get textTheme => theme.textTheme;
}
