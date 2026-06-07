import 'package:flutter/material.dart';

abstract final class AppColorsLight {
  AppColorsLight._();

  // Main Colors
  static const Color primary = Color(0xFFEC5F5F);
  static const Color secondary = Color(0xFF4DC9D1);
  static const Color tertiary = Color(0xFF8D5EF2);

  static const Color selektonizerLaoding = Color(0xFFE5E7EB);

  // Text
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6B7280);

  // UI
  static const Color stroke = Color(0xFFE5E7EB);
  static const Color shades = Color(0xFFFFFFFF);
  static const Color button = primary;
  static const Color icon = primary;
  static const Color background = Color(0xFFF8FAFC);
  static const Color divider = Color(0xFFE5E7EB);
  static const Color rate = Color(0xFFFCD034);

  // Common
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color spinKitColor = primary;

  // Semantic
  static Color get surface => white;
  static Color get onPrimary => white;
  static Color get onSurface => textPrimary;
  static Color get onBackground => textPrimary;

  static Color get shadowLight => black.withOpacity(.04);
  static Color get shadowMedium => black.withOpacity(.08);
  static Color get shadowDark => black.withOpacity(.15);

  static Color get border => stroke;

  // Splash
  static const Color splashStart = Color(0xFFEC5F5F);
  static const Color splashEnd = Color(0xFF4DC9D1);
  static const Color splashIcon = Color(0xFFFFFFFF);

  // Onboarding
  static const Color glowColor = Color(0x33EC5F5F);
  static const Color dotActive = primary;
  static const Color dotInactive = Color(0xFFD1D5DB);

  // Forms
  static const Color fieldBackground = Color(0xFFFFFFFF);
  static const Color fieldBorder = Color(0xFFE5E7EB);
  static const Color checkboxActive = primary;
  static const Color linkColor = primary;
  static const Color validIcon = Color(0xFF4ED442);
  static const Color invalidIcon = Color(0xFFEC5F5F);

  // Shimmer
  static const Color shimmerBase = Color(0xFFF1F5F9);
  static const Color shimmerHighlight = Color(0xFFFFFFFF);
}