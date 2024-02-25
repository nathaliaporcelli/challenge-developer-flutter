import 'package:flutter/material.dart';

import '../../common/extensions/context_theme_extensions.dart';

class CeslaTextField extends StatelessWidget {
  final String labelText;
  final String? initialValue;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onPressedSuffix;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final bool obscureText;
  final VoidCallback? onTap;
  final bool readOnly;

  const CeslaTextField({
    super.key,
    required this.labelText,
    this.initialValue,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressedSuffix,
    this.onChanged,
    this.controller,
    this.validator,
    this.onSaved,
    this.obscureText = false,
    this.onTap,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: initialValue,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.colors.error,
          ),
        ),
        errorStyle: TextStyle(
          color: context.colors.error,
        ),
        labelText: labelText,
        labelStyle: context.texts.label,
        prefixIcon: getPrefixIcon(),
        suffixIcon: getSuffixIcon(),
      ),
    );
  }

  Widget? getPrefixIcon() {
    if (prefixIcon == null) {
      return null;
    }
    return Icon(prefixIcon);
  }

  Widget? getSuffixIcon() {
    if (suffixIcon == null) {
      return null;
    }
    return IconButton(
      icon: Icon(
        suffixIcon,
      ),
      onPressed: onPressedSuffix,
    );
  }
}
