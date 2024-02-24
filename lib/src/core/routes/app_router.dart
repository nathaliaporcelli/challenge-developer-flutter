import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

class AppRouter {
  static final AppRouter instance = AppRouter._internal();

  factory AppRouter() => instance;

  AppRouter._internal();

  GoRouter get router {
    return GoRouter(
      navigatorKey: GlobalKey<NavigatorState>(),
      debugLogDiagnostics: true,
      initialLocation: Routes.splash.path,
      routes: _routes,
    );
  }

  List<GoRoute> get _routes {
    return [
      GoRoute(
        path: Routes.splash.path,
        builder: (_, __) => Routes.splash.page,
      ),
    ];
  }
}
