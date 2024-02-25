import 'package:flutter/material.dart';

import '../../../design_system.dart';

class CeslaDateTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CeslaDateTextField({
    super.key,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return CeslaTextField(
      labelText: 'Data de nascimento',
      prefixIcon: Icons.person_outline,
      controller: controller,
      readOnly: true,
      validator: validator,
      suffixIcon: Icons.date_range_rounded,
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: controller.text.isNotEmpty ? controller.text.dateTimeFromDDMMYYYY() : DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (date != null) {
          controller.text = date.formatToDDMMYYYY();
        }
      },
    );
  }
}
