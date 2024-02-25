import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../widgets/float_action_add_student_widget.dart';
import '../widgets/menu_app_bar.dart';
import '../widgets/student_card_widget.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MenuAppBar(title: 'Alunos'),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: CeslaTextField(
              labelText: 'Buscar...',
              prefixIcon: Icons.search,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 80),
              itemCount: 10,
              separatorBuilder: (__, _) => const SizedBox(height: 16),
              itemBuilder: (__, _) => const StudentCard(),
            ),
          ),
        ],
      ),
      floatingActionButton: const FloatActionAddStudent(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
