import 'package:flutter/widgets.dart';

import '../../modules/login/presenter/pages/login_page.dart';
import '../../modules/splash/presenter/pages/splash_page.dart';

enum Routes {
  splash('/', SplashPage()),
  login('/login', LoginPage());

  final String path;
  final Widget page;

  const Routes(this.path, this.page);
}
