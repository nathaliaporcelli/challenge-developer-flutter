import 'package:flutter/material.dart';

import '../../common/colors/cesla_color_scheme.dart';
import '../../common/extensions/context_theme_extensions.dart';

class CeslaElevatedButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final double heigth;

  const CeslaElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.heigth = 48,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heigth,
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: CeslaThemeColors.primary,
        ),
        child: Text(
          title,
          style: context.texts.label.copyWith(
            color: CeslaThemeColors.white,
          ),
        ),
      ),
    );
  }
}
