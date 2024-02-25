import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

extension ContextThemeExtension on BuildContext {
  CeslaTextStylesExtension get texts => Theme.of(this).extension<CeslaTextStylesExtension>()!;
  ColorScheme get colors => Theme.of(this).colorScheme;
}
