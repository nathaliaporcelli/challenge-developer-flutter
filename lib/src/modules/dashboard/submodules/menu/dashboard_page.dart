import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import 'presenter/pages/menu_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: const [
                MenuPage(),
              ],
            ),
          ),
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedLabelStyle: context.texts.caption,
            unselectedLabelStyle: context.texts.caption,
            selectedItemColor: context.colors.secondary,
            unselectedItemColor: context.colors.secondary,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu,
                ),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.help_outline,
                ),
                label: 'Ajuda',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications_none_outlined,
                ),
                label: 'Notificações',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                ),
                label: 'Perfil',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
