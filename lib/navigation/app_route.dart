enum AppRoute {
  root(path: '/'),
  splash(path: '/splash'),
  auth(path: '/auth'),
  signIn(path: '/auth/signIn'),
  signUp(path: '/auth/signUp'),
  main(path: '/main');

  final String path;
  const AppRoute({required this.path});
}
