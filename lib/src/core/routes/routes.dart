import 'package:flutter/widgets.dart';

import '../../modules/splash/presenter/pages/splash_page.dart';

enum Routes {
  splash('/', SplashPage());

  final String path;
  final Widget page;

  const Routes(this.path, this.page);
}
