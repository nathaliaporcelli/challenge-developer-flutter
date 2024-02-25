import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AccountRecoveryText extends StatelessWidget {
  const AccountRecoveryText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(4),
          child: Text(
            'Esqueci o usuário',
            style: context.texts.label.copyWith(
              color: context.colors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          ' ou ',
          style: context.texts.label,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {},
          child: Text(
            'Esqueci a senha',
            style: context.texts.label.copyWith(
              color: context.colors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
