import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:pole/navigation/app_route.dart';

final class AppRouter {
  late final value = GoRouter(
    initialLocation: AppRoute.splash.path,
    routes: [
      GoRoute(
        path: AppRoute.splash.path,
        name: AppRoute.splash.name,
        builder: (context, state) => Text('TODO: Splash'),
      ),
    ],
  );
}
