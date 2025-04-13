import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_step.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_screen.dart' as auth;
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/screens.dart';

final _navigatorKey = GlobalKey<NavigatorState>();
Object? _redirectExtra;

final class AppRouter {
  late final value = GoRouter(
    navigatorKey: _navigatorKey,
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
          final extra = (state.extra ?? _redirectExtra) as AuthExtra;
          return AuthScreen(bloc: extra.authBloc, navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.auth.path,
                name: AppRoute.auth.name,
                redirect: (context, state) {
                  final extra = state.extra as AuthExtra;
                  final bloc = extra.authBloc;

                  _redirectExtra = bloc.redirectExtra();

                  switch (bloc.state.screen) {
                    case auth.AuthScreen.signIn:
                      return AppRoute.signIn.path;
                    case auth.AuthScreen.signUp:
                      return AppRoute.signUp.path;
                  }
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.signIn.path,
                name: AppRoute.signIn.name,
                builder: (context, state) {
                  final extra = (state.extra ?? _redirectExtra) as AuthExtra;
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
                  final extra = (state.extra ?? _redirectExtra) as AuthExtra;
                  return SignUpScreen(bloc: extra.signUpBloc!);
                },
              ),
            ],
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          final extra = (state.extra ?? _redirectExtra) as MainExtra;
          return MainScreen(bloc: extra.mainBloc, navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.main.path,
                name: AppRoute.main.name,
                builder: (context, state) => SizedBox(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.catalog.path,
                name: AppRoute.catalog.name,
                builder: (context, state) {
                  final extra = (state.extra ?? _redirectExtra) as MainExtra;
                  return Text('TODO: CatalogScreen');
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              StatefulShellRoute.indexedStack(
                builder: (context, state, navigationShell) {
                  final extra = (state.extra ?? _redirectExtra) as MainExtra;
                  return ExcursionsScreen(
                    bloc: extra.excursionsExtra!.excursionsBloc,
                    navigationShell: navigationShell,
                  );
                },
                branches: [
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                        path: AppRoute.excursions.path,
                        name: AppRoute.excursions.name,
                        redirect: (context, state) {
                          final extra = state.extra as MainExtra;
                          final bloc = extra.excursionsExtra!.excursionsBloc;

                          _redirectExtra = bloc.redirectExtra(mainBloc: extra.mainBloc);

                          return switch (bloc.state.step) {
                            DateSelection() => AppRoute.dateSelection.path,
                            Planning() => AppRoute.planning.path,
                            Overview() => AppRoute.overview.path,
                          };
                        },
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                        path: AppRoute.dateSelection.path,
                        name: AppRoute.dateSelection.name,
                        builder: (context, state) {
                          final mainExtra = (state.extra ?? _redirectExtra) as MainExtra;
                          final extra = mainExtra.excursionsExtra!;
                          return DateSelectionScreen(bloc: extra.dateSelectionBloc!);
                        },
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                        path: AppRoute.planning.path,
                        name: AppRoute.planning.name,
                        builder: (context, state) {
                          final mainExtra = (state.extra ?? _redirectExtra) as MainExtra;
                          final extra = mainExtra.excursionsExtra!;
                          return PlanningScreen(bloc: extra.planningBloc!);
                        },
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                        path: AppRoute.overview.path,
                        name: AppRoute.overview.name,
                        builder: (context, state) {
                          final mainExtra = (state.extra ?? _redirectExtra) as MainExtra;
                          final extra = mainExtra.excursionsExtra!;
                          return OverviewScreen(bloc: extra.overviewBloc!);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.profile.path,
                name: AppRoute.profile.name,
                builder: (context, state) {
                  final extra = (state.extra ?? _redirectExtra) as MainExtra;
                  return Text('TODO: ProfileScreen');
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
