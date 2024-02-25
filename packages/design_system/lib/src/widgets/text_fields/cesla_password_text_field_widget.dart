import 'package:flutter/material.dart';

import 'cesla_text_field_widget.dart';

class CeslaPasswordTextField extends StatefulWidget {
  final Function(String?)? onSaved;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CeslaPasswordTextField({
    super.key,
    this.onSaved,
    required this.controller,
    this.validator,
  });

  @override
  State<CeslaPasswordTextField> createState() => _CeslaPasswordTextFieldState();
}

class _CeslaPasswordTextFieldState extends State<CeslaPasswordTextField> {
  bool isShowingPassword = false;

  @override
  Widget build(BuildContext context) {
    return CeslaTextField(
      labelText: 'Senha',
      controller: widget.controller,
      onSaved: widget.onSaved,
      validator: widget.validator,
      prefixIcon: Icons.lock_outline,
      suffixIcon: getSuffixIcon(),
      onPressedSuffix: () {
        setState(() {
          isShowingPassword = !isShowingPassword;
        });
      },
      obscureText: !isShowingPassword,
    );
  }

  IconData getSuffixIcon() {
    if (isShowingPassword) return Icons.remove_red_eye_outlined;

    return Icons.visibility_off_outlined;
  }
}
