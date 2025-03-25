enum AppRoute {
  root(path: '/'),
  splash(path: '/splash'),
  auth(path: '/auth'),
  signIn(path: '/auth/signIn'),
  signUp(path: '/auth/signUp'),
  main(path: '/main'),
  catalog(path: '/main/catalog'),
  excursions(path: '/main/excursions'),
  profile(path: '/main/profile');

  final String path;
  const AppRoute({required this.path});
}
