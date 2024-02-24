import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: PageView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => Container(
          color: index % 2 == 0 ? Colors.blue : Colors.red,
        ),
      ),
    );
  }
}
