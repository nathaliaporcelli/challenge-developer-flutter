import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/routes.dart';
import '../controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  final SplashController controller;

  const SplashPage({
    super.key,
    required this.controller,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.isAuthenticated().then((value) {
      if (value) {
        return context.go(Routes.dashboard.path);
      }
      return context.go(Routes.login.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CeslaImage(
          path: CeslaImages.icon.path,
        ),
      ),
    );
  }
}
