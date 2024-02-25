import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MenuAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.primary,
      automaticallyImplyLeading: false,
      leading: context.canPop()
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => context.pop(),
            )
          : null,
      title: Text(
        title,
        style: context.texts.header.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
