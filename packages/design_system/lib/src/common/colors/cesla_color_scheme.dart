import 'package:flutter/material.dart';

class CelsaThemeColors {
  static const primary = Color(0xff2f617e);
  static const white = Color(0xffffffff);
  static const black = Color(0xff27262a);
  static const red = Colors.red;
}

class CelsaColorScheme extends ColorScheme {
  const CelsaColorScheme({
    super.brightness = Brightness.dark,
    super.primary = CelsaThemeColors.primary,
    super.onPrimary = CelsaThemeColors.primary,
    super.secondary = CelsaThemeColors.primary,
    super.onSecondary = CelsaThemeColors.primary,
    super.error = CelsaThemeColors.red,
    super.onError = CelsaThemeColors.white,
    super.background = CelsaThemeColors.white,
    super.onBackground = CelsaThemeColors.primary,
    super.surface = CelsaThemeColors.white,
    super.onSurface = CelsaThemeColors.primary,
    super.surfaceVariant = CelsaThemeColors.primary,
  });
}
