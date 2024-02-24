import 'package:flutter/material.dart';

class CelsaThemeColors {
  static const primary = Color(0xff2f617e);
  static const white = Color(0xffffffff);
  static const black = Color(0xff27262a);
}

class CelsaColorScheme extends ColorScheme {
  const CelsaColorScheme({
    super.brightness = Brightness.dark,
    super.primary = CelsaThemeColors.primary,
    super.onPrimary = CelsaThemeColors.primary,
    super.secondary = CelsaThemeColors.primary,
    super.onSecondary = CelsaThemeColors.primary,
    super.error = CelsaThemeColors.primary,
    super.onError = CelsaThemeColors.primary,
    super.background = CelsaThemeColors.white,
    super.onBackground = CelsaThemeColors.primary,
    super.surface = CelsaThemeColors.primary,
    super.onSurface = CelsaThemeColors.primary,
    super.surfaceVariant = CelsaThemeColors.primary,
  });
}
