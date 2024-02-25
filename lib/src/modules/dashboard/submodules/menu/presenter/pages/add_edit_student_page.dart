import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/mixins/validation_mixin.dart';
import '../../domain/dtos/student_dto.dart';
import '../../domain/entities/student_entity.dart';
import '../stores/menu_store.dart';
import '../widgets/menu_app_bar.dart';

class AddEditStudentPage extends StatefulWidget {
  final StudentEntity? studentEntity;
  final MenuStore menuStore;

  const AddEditStudentPage({
    super.key,
    required this.studentEntity,
    required this.menuStore,
  });

  @override
  State<AddEditStudentPage> createState() => _AddEditStudentPageState();
}

class _AddEditStudentPageState extends State<AddEditStudentPage> with ValidationMixin {
  late final bool isEdit;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final cpfController = TextEditingController();
  final academicRecordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    isEdit = widget.studentEntity != null;

    if (isEdit) {
      nameController.text = widget.studentEntity!.name;
      if (widget.studentEntity!.birthDate != null) {
        dateController.text = widget.studentEntity!.birthDate!.formatToDDMMYYYY();
      }
      cpfController.text = widget.studentEntity!.cpf;
      academicRecordController.text = widget.studentEntity!.academicRecord;
      emailController.text = widget.studentEntity!.email;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    dateController.dispose();
    cpfController.dispose();
    academicRecordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuAppBar(title: isEdit ? 'Editar aluno' : 'Adicionar aluno'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const RangeMaintainingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 16),
                  children: [
                    Text(
                      'Dados gerais',
                      style: context.texts.label.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    CeslaTextField(
                      labelText: 'Nome do aluno*',
                      prefixIcon: Icons.person_outline,
                      controller: nameController,
                      validator: isNotEmpty,
                    ),
                    const SizedBox(height: 16),
                    CeslaDateTextField(
                      controller: dateController,
                    ),
                    const SizedBox(height: 16),
                    CeslaTextField(
                      labelText: 'CPF*',
                      prefixIcon: Icons.person_outline,
                      controller: cpfController,
                      validator: isNotEmpty,
                    ),
                    const SizedBox(height: 16),
                    CeslaTextField(
                      labelText: 'Registro acadêmico*',
                      prefixIcon: Icons.person_outline,
                      controller: academicRecordController,
                      validator: isNotEmpty,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Dados de acesso',
                      style: context.texts.label.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    CeslaTextField(
                      labelText: 'E-mail*',
                      prefixIcon: Icons.person_outline,
                      controller: emailController,
                      validator: isNotEmpty,
                    ),
                  ],
                ),
              ),
              CeslaElevatedButton(
                title: isEdit ? 'Editar' : 'Adicionar',
                onPressed: onSave,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onSave() async {
    if (isEdit) {
      await widget.menuStore.editStudent(
        widget.studentEntity!.id,
        StudentDTO(
          name: nameController.text,
          email: emailController.text,
          birthDate: dateController.text.dateTimeFromDDMMYYYY(),
          academicRecord: academicRecordController.text,
          cpf: cpfController.text,
        ),
      );
      return;
    }

    await widget.menuStore.addStudent(
      StudentDTO(
        name: nameController.text,
        email: emailController.text,
        birthDate: dateController.text.dateTimeFromDDMMYYYY(),
        academicRecord: academicRecordController.text,
        cpf: cpfController.text,
      ),
    );
  }
}
