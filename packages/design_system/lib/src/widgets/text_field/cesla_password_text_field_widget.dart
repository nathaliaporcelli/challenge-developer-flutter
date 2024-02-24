import 'package:design_system/src/widgets/text_field/cesla_text_field_widget.dart';
import 'package:flutter/material.dart';

class CeslaPasswordTextField extends StatefulWidget {
  final String? initialValue;
  const CeslaPasswordTextField({super.key, this.initialValue});

  @override
  State<CeslaPasswordTextField> createState() => _CeslaPasswordTextFieldState();
}

class _CeslaPasswordTextFieldState extends State<CeslaPasswordTextField> {
  bool isShowingPassword = false;

  @override
  Widget build(BuildContext context) {
    return CeslaTextField(
      labelText: 'Senha',
      controller: TextEditingController.fromValue(
        TextEditingValue(
          text: getInitialValue() ?? '',
        ),
      ),
      prefixIcon: Icons.lock_outline,
      suffixIcon: getSuffixIcon(),
      onPressedSuffix: () {
        setState(() {
          isShowingPassword = !isShowingPassword;
        });
      },
    );
  }

  String? getInitialValue() {
    if (widget.initialValue == null) return null;

    if (isShowingPassword) return widget.initialValue;

    return widget.initialValue!.replaceAll(RegExp(r'.'), '*');
  }

  IconData getSuffixIcon() {
    if (isShowingPassword) return Icons.remove_red_eye_outlined;

    return Icons.visibility_off_outlined;
  }
}
