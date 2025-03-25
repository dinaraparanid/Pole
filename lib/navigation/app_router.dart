import 'package:flutter/widgets.dart';
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
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          final extra = state.extra as AuthExtra;
          return AuthScreen(navigationShell: navigationShell, bloc: extra.authBloc);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.auth.path,
                name: AppRoute.auth.name,
                builder: (context, state) => SizedBox(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.signIn.path,
                name: AppRoute.signIn.name,
                builder: (context, state) {
                  final extra = state.extra as AuthExtra;
                  return SignInScreen(bloc: extra.signInBloc!);
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.signUp.path,
                name: AppRoute.signUp.name,
                builder: (context, state) {
                  final extra = state.extra as AuthExtra;
                  return SignUpScreen(bloc: extra.signUpBloc!);
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoute.main.path,
        name: AppRoute.main.name,
        builder: (context, state) => MainScreen(bloc: state.extra as MainBloc),
      ),
    ],
  );
}
