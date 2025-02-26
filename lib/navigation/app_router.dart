import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/screens.dart';

final class AppRouter {
  late final value = GoRouter(
    initialLocation: AppRoute.root.path,
    routes: [
      GoRoute(
        path: AppRoute.root.path,
        name: AppRoute.root.name,
        builder: (context, state) => RootScreen(bloc: context.read<RootBloc>()),
      ),
      GoRoute(
        path: AppRoute.splash.path,
        name: AppRoute.splash.name,
        builder: (context, state) => SplashScreen(bloc: state.extra as SplashBloc),
      ),
      GoRoute(
        path: AppRoute.auth.path,
        name: AppRoute.auth.name,
        builder: (context, state) => Text('TODO: Auth'),
      ),
    ],
  );
}
