enum Routes {
  splash('splash', '/'),
  // welcome('welcome', '/welcome'),
  auth('auth', '/auth'),
  home('home', '/home');

  final String name;
  final String path;

  const Routes(this.name, this.path);
}
