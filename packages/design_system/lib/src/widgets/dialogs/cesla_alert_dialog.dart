import 'package:flutter/material.dart';

import '../../../design_system.dart';
import '../../common/colors/cesla_color_scheme.dart';

class CeslaAlertDialog {
  static void show({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = 'Ok',
    VoidCallback? onConfirm,
  }) {
    showDialog(
      context: context,
      barrierColor: CeslaThemeColors.grey.withOpacity(0.25),
      builder: (context) {
        return AlertDialog(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          title: Text(
            title,
            style: context.texts.header.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            message,
            style: context.texts.label,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: onConfirm,
              child: Text(confirmText),
            ),
          ],
        );
      },
    );
  }
}
