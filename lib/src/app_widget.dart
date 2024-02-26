import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'app_router.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final _router = AppRouter.instance.router;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(
      AssetImage(
        CeslaImages.icon.path,
        package: 'design_system',
      ),
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: CeslaTheme.get(),
      title: 'Cesla',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
