import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class FloatActionAddStudent extends StatelessWidget {
  final VoidCallback onTap;

  const FloatActionAddStudent({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: context.colors.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.add,
            ),
            Text(
              'Adicionar aluno',
              style: context.texts.label.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
