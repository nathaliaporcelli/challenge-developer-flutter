import 'package:design_system/src/common/colors/cesla_color_scheme.dart';
import 'package:design_system/src/common/extensions/cesla_text_styles_extension.dart';
import 'package:flutter/material.dart';

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
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: CelsaThemeColors.primary,
        ),
        child: Text(
          title,
          style: Theme.of(context).extension<CelsaTextStylesExtension>()!.label.copyWith(
                color: CelsaThemeColors.white,
              ),
        ),
      ),
    );
  }
}
