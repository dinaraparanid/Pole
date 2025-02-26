enum AppRoute {
  root(path: '/root'),
  splash(path: '/splash'),
  main(path: '/main');

  final String path;
  const AppRoute({required this.path});
}
