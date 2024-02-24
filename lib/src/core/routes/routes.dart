enum Routes {
  splash('/'),
  login('/login'),
  dashboard('/dashboard');

  final String path;

  const Routes(this.path);
}
