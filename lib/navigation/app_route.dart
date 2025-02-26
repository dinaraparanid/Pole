enum AppRoute {
  root(path: '/root'),
  splash(path: '/splash'),
  auth(path: '/auth'),
  main(path: '/main');

  final String path;
  const AppRoute({required this.path});
}
