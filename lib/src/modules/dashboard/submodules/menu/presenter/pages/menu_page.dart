import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/routes/routes.dart';
import '../stores/menu_store.dart';
import '../widgets/float_action_add_student_widget.dart';
import '../widgets/menu_app_bar.dart';
import '../widgets/student_card_widget.dart';

class MenuPage extends StatefulWidget {
  final MenuStore menuStore;

  const MenuPage({super.key, required this.menuStore});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    super.initState();

    widget.menuStore.getAllStudents();
    widget.menuStore.fetchStudents.addListener(fetchListenerFunction);
  }

  @override
  void dispose() {
    widget.menuStore.fetchStudents.removeListener(fetchListenerFunction);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fetchStudents = widget.menuStore.fetchStudents;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MenuAppBar(title: 'Alunos'),
      body: RefreshIndicator(
        onRefresh: () => widget.menuStore.getAllStudents(),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: CeslaTextField(
                labelText: 'Buscar...',
                prefixIcon: Icons.search,
              ),
            ),
            Expanded(
              child: ListenableBuilder(
                listenable: fetchStudents,
                builder: (context, child) {
                  if (fetchStudents.value.isSuccess) {
                    return ListView.separated(
                      padding: const EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 80),
                      itemCount: fetchStudents.value.asSuccess.students.length,
                      separatorBuilder: (__, _) => const SizedBox(height: 16),
                      itemBuilder: (_, index) => StudentCard(
                        student: fetchStudents.value.asSuccess.students[index],
                        onTapDelete: () async {
                          CeslaConfirmDialog.show(
                            context: context,
                            title: 'Excluir aluno',
                            confirmText: 'Excluir aluno',
                            message:
                                'Tem certeza que deseja excluir esse aluno? Todas as informações dele serão apagadas.',
                            onConfirm: () {
                              widget.menuStore.deleteStudentById(fetchStudents.value.asSuccess.students[index].id);
                              context.pop();
                            },
                          );
                        },
                        onTapEdit: () {
                          context
                              .pushNamed(
                                Routes.addEditStudent.name,
                                extra: fetchStudents.value.asSuccess.students[index],
                              )
                              .then((value) => showEditedModal());
                        },
                      ),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatActionAddStudent(
        onTap: () => context
            .pushNamed(
              Routes.addEditStudent.name,
            )
            .then((value) => showCreatedModal()),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void showCreatedModal() {
    if (widget.menuStore.createStudents.value.isSuccess) {
      CeslaAlertDialog.show(
        context: context,
        title: 'Aluno adicionado',
        message: 'O aluno foi adicionado com sucesso!',
        onConfirm: () => context.pop(),
      );
    }
  }

  void showEditedModal() {
    if (widget.menuStore.editStudents.value.isSuccess) {
      CeslaAlertDialog.show(
        context: context,
        title: 'Aluno editado',
        message: 'O aluno foi editado com sucesso!',
        onConfirm: () => context.pop(),
      );
    }
  }

  void fetchListenerFunction() {
    if (widget.menuStore.fetchStudents.value.isError) {
      final errorMessage = widget.menuStore.fetchStudents.value.asError.exception.message;

      CeslaErrorToast.show(context, errorMessage);
    }
  }
}
