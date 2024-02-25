import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/student_entity.dart';

class StudentCard extends StatelessWidget {
  final StudentEntity student;
  final VoidCallback onTapEdit;
  final VoidCallback onTapDelete;

  const StudentCard({
    super.key,
    required this.student,
    required this.onTapEdit,
    required this.onTapDelete,
  });

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
                  student.name,
                  style: context.texts.label.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  student.academicRecord,
                  style: context.texts.label,
                ),
                Text(
                  'CPF: ${student.cpf}',
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
                  onTap: onTapEdit,
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
                  onTap: onTapDelete,
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
