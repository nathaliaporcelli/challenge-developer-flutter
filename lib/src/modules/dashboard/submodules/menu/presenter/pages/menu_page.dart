import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../widgets/menu_app_bar.dart';
import '../widgets/student_card_widget.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              itemCount: 5,
              separatorBuilder: (__, _) => const SizedBox(height: 16),
              itemBuilder: (__, _) => const StudentCard(),
            ),
          ),
        ],
      ),
    );
  }
}
