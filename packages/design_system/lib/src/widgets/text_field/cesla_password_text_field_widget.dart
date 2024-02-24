import 'package:design_system/src/widgets/text_field/cesla_text_field_widget.dart';
import 'package:flutter/material.dart';

class CeslaPasswordTextField extends StatefulWidget {
  final Function(String?)? onSaved;

  const CeslaPasswordTextField({super.key, this.onSaved});

  @override
  State<CeslaPasswordTextField> createState() => _CeslaPasswordTextFieldState();
}

class _CeslaPasswordTextFieldState extends State<CeslaPasswordTextField> {
  bool isShowingPassword = false;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CeslaTextField(
      labelText: 'Senha',
      controller: _controller,
      onSaved: widget.onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo obrigatório';
        }
        return null;
      },
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
