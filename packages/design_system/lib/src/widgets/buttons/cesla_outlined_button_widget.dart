import 'package:design_system/src/common/colors/cesla_color_scheme.dart';
import 'package:design_system/src/common/extensions/cesla_text_styles_extension.dart';
import 'package:flutter/material.dart';

class CeslaOutlinedButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final double heigth;

  const CeslaOutlinedButton({
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
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: CeslaThemeColors.primary,
            width: 1,
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).extension<CeslaTextStylesExtension>()!.label.copyWith(
                color: CeslaThemeColors.primary,
              ),
        ),
      ),
    );
  }
}
