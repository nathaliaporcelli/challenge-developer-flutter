import 'package:flutter/material.dart';

import '../../../design_system.dart';

extension ContextThemeExtension on BuildContext {
  CeslaTextStylesExtension get texts => Theme.of(this).extension<CeslaTextStylesExtension>()!;
  ColorScheme get colors => Theme.of(this).colorScheme;
}
