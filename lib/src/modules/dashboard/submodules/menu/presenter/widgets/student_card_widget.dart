import 'package:flutter/material.dart';

import '../../../../../../core/extensions/context_extensions.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ana Julia',
                  style: context.texts.label.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '158453',
                  style: context.texts.label,
                ),
                Text(
                  'CPF: 086.7197.29-80',
                  style: context.texts.label,
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {},
                  child: SizedBox(
                    height: 36,
                    width: 36,
                    child: Icon(
                      Icons.edit_outlined,
                      color: context.colors.secondary,
                    ),
                  ),
                ),
              ),
              Material(
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {},
                  child: SizedBox(
                    height: 36,
                    width: 36,
                    child: Icon(
                      Icons.delete_outline,
                      color: context.colors.secondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
