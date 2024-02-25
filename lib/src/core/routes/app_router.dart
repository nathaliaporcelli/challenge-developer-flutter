import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../modules/auth/presenter/pages/auth_page.dart';
import '../../modules/auth/presenter/stores/auth_store.dart';
import '../../modules/dashboard/dashboard_page.dart';
import '../../modules/dashboard/submodules/menu/presenter/stores/menu_store.dart';
import '../../modules/splash/presenter/pages/splash_page.dart';
import '../services/injector/app_injector.dart';
import 'routes.dart';

class AppRouter {
  static final AppRouter instance = AppRouter._internal();

  factory AppRouter() => instance;

  AppRouter._internal();

  final navigatorKey = GlobalKey<NavigatorState>();

  GoRouter get router {
    return GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      initialLocation: Routes.splash.path,
      routes: _routes,
    );
  }

  List<GoRoute> get _routes {
    return [
      GoRoute(
        path: Routes.splash.path,
        builder: (_, __) => const SplashPage(),
      ),
      GoRoute(
        path: Routes.login.path,
        builder: (_, __) => AuthPage(
          authStore: AppInjector.retrive<AuthStore>(),
        ),
      ),
      GoRoute(
        path: Routes.dashboard.path,
        builder: (_, __) => DashboardPage(
          menuStore: AppInjector.retrive<MenuStore>(),
        ),
      ),
    ];
  }
}
