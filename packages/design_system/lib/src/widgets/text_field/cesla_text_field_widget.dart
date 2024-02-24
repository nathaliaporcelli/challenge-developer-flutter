import 'package:flutter/material.dart';

class CeslaTextField extends StatelessWidget {
  final String labelText;
  final String? initialValue;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? onPressedSuffix;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  const CeslaTextField({
    super.key,
    required this.labelText,
    this.initialValue,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressedSuffix,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
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
      icon: Icon(suffixIcon),
      onPressed: onPressedSuffix,
    );
  }
}
