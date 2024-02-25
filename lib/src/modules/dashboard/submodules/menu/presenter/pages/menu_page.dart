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

    widget.menuStore.addListener(() {
      if (widget.menuStore.value.isError) {
        final errorMessage = widget.menuStore.value.asError.exception.message;

        CeslaErrorToast.show(context, errorMessage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                listenable: widget.menuStore,
                builder: (context, child) {
                  if (widget.menuStore.value.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.separated(
                    padding: const EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 80),
                    itemCount: widget.menuStore.students.length,
                    separatorBuilder: (__, _) => const SizedBox(height: 16),
                    itemBuilder: (__, index) => StudentCard(
                      student: widget.menuStore.students[index],
                      onTapDelete: () async {
                        await widget.menuStore.deleteStudentById(widget.menuStore.students[index].id);
                        await widget.menuStore.getAllStudents();
                      },
                      onTapEdit: () {
                        context.pushNamed(
                          Routes.addEditStudent.name,
                          extra: widget.menuStore.students[index],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatActionAddStudent(
        onTap: () => context.pushNamed(Routes.addEditStudent.name),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
