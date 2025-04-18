enum AppRoute {
  root(path: '/'),
  splash(path: '/splash'),
  auth(path: '/auth'),
  signIn(path: '/auth/signIn'),
  signUp(path: '/auth/signUp'),
  main(path: '/main'),
  catalog(path: '/main/catalog'),
  excursions(path: '/main/excursions'),
  dateSelection(path: '/main/excursions/dateSelection'),
  planning(path: '/main/excursions/planning'),
  overview(path: '/main/excursions/overview'),
  creationFinish(path: '/main/excursions/creation_finish'),
  profile(path: '/main/profile');

  final String path;
  const AppRoute({required this.path});
}
