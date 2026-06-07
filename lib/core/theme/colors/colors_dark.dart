import 'package:flutter/material.dart';

abstract final class AppColorsDark {
  AppColorsDark._();

  // Main Colors
  static const Color primary = Color(0xFFEC5F5F);
  static const Color secondary = Color(0xFF4DC9D1);
  static const Color tertiary = Color(0xFF8D5EF2);

  static const Color selektonizerLoading = Color(0xFF2A2A2A);

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFA1A1AA);

  // UI
  static const Color stroke = Color(0xFF2D3748);
  static const Color shades = Color(0xFF0F172A);
  static const Color button = primary;
  static const Color icon = secondary;
  static const Color background = Color(0xFF020617);
  static const Color divider = Color(0xFF1E293B);
  static const Color rate = Color(0xFFFCD034);

  // Common
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color spinKitColor = primary;

  // Semantic
  static Color get surface => const Color(0xFF0F172A);
  static Color get onPrimary => white;
  static Color get onSurface => textPrimary;
  static Color get onBackground => textPrimary;

  static Color get shadowLight => black.withOpacity(.2);
  static Color get shadowMedium => black.withOpacity(.4);
  static Color get shadowDark => black.withOpacity(.6);

  static Color get border => stroke;

  // Splash
  static const Color splashStart = Color(0xFF020617);
  static const Color splashEnd = Color(0xFFEC5F5F);
  static const Color splashIcon = Color(0xFFFFFFFF);

  // Onboarding
  static const Color glowColor = Color(0xFFEC5F5F);
  static const Color dotActive = primary;
  static const Color dotInactive = Color(0xFF334155);

  // Forms
  static const Color fieldBackground = Color(0xFF0F172A);
  static const Color fieldBorder = Color(0xFF334155);
  static const Color checkboxActive = primary;
  static const Color linkColor = secondary;
  static const Color validIcon = Color(0xFF4ED442);
  static const Color invalidIcon = Color(0xFFEC5F5F);

  // Shimmer
  static const Color shimmerBase = Color(0xFF1E293B);
  static const Color shimmerHighlight = Color(0xFF334155);
}