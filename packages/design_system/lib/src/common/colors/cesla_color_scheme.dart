import 'package:flutter/material.dart';

class CeslaThemeColors {
  static const primary = Color(0xff2f617e);
  static const white = Color(0xffffffff);
  static const black = Color(0xff27262a);
  static const red = Colors.red;
}

class CeslaColorScheme extends ColorScheme {
  const CeslaColorScheme({
    super.brightness = Brightness.dark,
    super.primary = CeslaThemeColors.primary,
    super.onPrimary = CeslaThemeColors.primary,
    super.secondary = CeslaThemeColors.primary,
    super.onSecondary = CeslaThemeColors.primary,
    super.error = CeslaThemeColors.red,
    super.onError = CeslaThemeColors.white,
    super.background = CeslaThemeColors.white,
    super.onBackground = CeslaThemeColors.primary,
    super.surface = CeslaThemeColors.white,
    super.onSurface = CeslaThemeColors.primary,
    super.surfaceVariant = CeslaThemeColors.primary,
  });
}
