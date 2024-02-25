import 'package:flutter/material.dart';

import '../../common/colors/cesla_color_scheme.dart';
import '../../common/extensions/context_theme_extensions.dart';

class CeslaErrorToast {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: context.colors.error,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            message,
            maxLines: 2,
            style: context.texts.caption.copyWith(color: CeslaThemeColors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
