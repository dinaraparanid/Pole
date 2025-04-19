import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/core/domain/excursion/excursion.dart';
import 'package:pole/di/app_module.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/bloc/mod.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/sign_in_screen.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/mod.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/sign_up_screen.dart';
import 'package:pole/feature/auth/presentation/auth_screen.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_bloc_factory.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_route.dart';
import 'package:pole/feature/excursions/child/creation_finish/presentation/bloc/creation_finish_cubit_factory.dart';
import 'package:pole/feature/excursions/child/creation_finish/presentation/creation_finish_screen.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_bloc_factory.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/date_selection_screen.dart';
import 'package:pole/feature/excursions/child/overview/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/overview/presentation/overview_screen.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/planning/presentation/planning_screen.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_cubit.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_cubit_factory.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_step.dart';
import 'package:pole/feature/excursions/presentation/excursions_screen.dart';
import 'package:pole/feature/main/presentation/bloc/main_cubit.dart';
import 'package:pole/feature/main/presentation/bloc/main_cubit_factory.dart';
import 'package:pole/feature/main/presentation/bloc/main_state.dart';
import 'package:pole/feature/main/presentation/main_screen.dart';
import 'package:pole/feature/root/presentation/bloc/root_bloc_factory.dart';
import 'package:pole/feature/root/presentation/root_screen.dart';
import 'package:pole/feature/splash/presentation/bloc/splash_bloc_factory.dart';
import 'package:pole/feature/splash/presentation/splash_screen.dart';
import 'package:pole/navigation/observer/auth_navigator_observer.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/observer/excursions_navigator_observer.dart';
import 'package:pole/navigation/observer/main_navigator_observer.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final class AppRouter {
  final AuthNavigatorObserver _authObserver;
  final MainNavigatorObserver _mainObserver;
  final ExcursionsNavigatorObserver _excursionsObserver;

  AppRouter({
    required AuthNavigatorObserver authObserver,
    required ExcursionsNavigatorObserver excursionsObserver,
    required MainNavigatorObserver mainObserver,
  }) : _authObserver = authObserver,
    _excursionsObserver = excursionsObserver,
    _mainObserver = mainObserver;

  late final value = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoute.root.path,
    routes: [
      GoRoute(
        path: AppRoute.root.path,
        name: AppRoute.root.name,
        builder: (context, state) => RootScreen(
          blocFactory: di<RootBlocFactory>(),
        ),
      ),
      GoRoute(
        path: AppRoute.splash.path,
        name: AppRoute.splash.name,
        builder: (context, state) => SplashScreen(
          blocFactory: di<SplashBlocFactory>(),
        ),
      ),
      ShellRoute(
        observers: [_authObserver],
        builder: (context, state, child) {
          _authObserver.storeExtra(state.extra);

          final route = (state.extra ?? _authObserver.extra) as AuthRoute;

          return AuthScreen(
            blocFactory: di<AuthBlocFactory>(),
            route: route,
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: AppRoute.auth.path,
            name: AppRoute.auth.name,
            redirect: (context, state) => _authObserver.redirectPath.path,
          ),
          GoRoute(
            path: AppRoute.signIn.path,
            name: AppRoute.signIn.name,
            builder: (context, state) => SignInScreen(
              blocFactory: di<SignInBlocFactory>(),
            ),
          ),
          GoRoute(
            path: AppRoute.signUp.path,
            name: AppRoute.signUp.name,
            builder: (context, state) => SignUpScreen(
              blocFactory: di<SignUpBlocFactory>(),
            ),
          ),
        ],
      ),
      ShellRoute(
        observers: [_mainObserver],
        builder: (context, state, child) => MainScreen(
          cubitFactory: di<MainCubitFactory>(),
          child: child,
        ),
        routes: [
          GoRoute(
            path: AppRoute.main.path,
            name: AppRoute.main.name,
            redirect: (context, state) => _mainObserver.redirectPath.path,
          ),
          GoRoute(
            path: AppRoute.catalog.path,
            name: AppRoute.catalog.name,
            builder: (context, state) {
              BlocProvider
                .of<MainCubit>(context)
                .selectTab(MainTabs.catalog);

              return Text('TODO: CatalogScreen');
            },
          ),
          ShellRoute(
            observers: [_excursionsObserver],
            builder: (context, state, navigationShell) {
              BlocProvider
                .of<MainCubit>(context)
                .selectTab(MainTabs.excursions);

              return ExcursionsScreen(
                blocFactory: di<ExcursionsCubitFactory>(),
                child: navigationShell,
              );
            },
            routes: [
              GoRoute(
                path: AppRoute.excursions.path,
                name: AppRoute.excursions.name,
                redirect: (context, state) =>
                  _excursionsObserver.redirectPath.path,
              ),
              GoRoute(
                path: AppRoute.dateSelection.path,
                name: AppRoute.dateSelection.name,
                builder: (context, state) {
                  BlocProvider
                    .of<ExcursionsCubit>(context)
                    .updateStep(ExcursionsStep.dateSelection());

                  return DateSelectionScreen(
                    blocFactory: di<DateSelectionBlocFactory>(),
                  );
                },
              ),
              GoRoute(
                path: AppRoute.planning.path,
                name: AppRoute.planning.name,
                builder: (context, state) {
                  _excursionsObserver.storeExtra(state.extra);

                  BlocProvider
                    .of<ExcursionsCubit>(context)
                    .updateStep(ExcursionsStep.planning());

                  final (city, date) = (state.extra ?? _excursionsObserver.extra)
                    as (City, DateTime);

                  return PlanningScreen(
                    blocFactory: di<PlanningBlocFactory>(),
                    city: city,
                    date: date,
                  );
                },
              ),
              GoRoute(
                path: AppRoute.overview.path,
                name: AppRoute.overview.name,
                builder: (context, state) {
                  _excursionsObserver.storeExtra(state.extra);

                  BlocProvider
                    .of<ExcursionsCubit>(context)
                    .updateStep(ExcursionsStep.overview());

                  final excursion = (state.extra ?? _excursionsObserver.extra)
                    as Excursion;

                  return OverviewScreen(
                    cubitFactory: di<OverviewCubitFactory>(),
                    excursion: excursion,
                  );
                },
              ),
              GoRoute(
                path: AppRoute.creationFinish.path,
                name: AppRoute.creationFinish.name,
                onExit: (_, _) {
                  _excursionsObserver.onExitCreationFinish();
                  return true;
                },
                builder: (context, state) {
                  BlocProvider
                    .of<ExcursionsCubit>(context)
                    .updateStep(ExcursionsStep.creationFinish());

                  return CreationFinishScreen(
                    cubitFactory: di<CreationFinishCubitFactory>(),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: AppRoute.profile.path,
            name: AppRoute.profile.name,
            builder: (context, state) {
              BlocProvider
                .of<MainCubit>(context)
                .selectTab(MainTabs.profile);

              return Text('TODO: ProfileScreen');
            },
          ),
        ],
      ),
    ],
  );
}
