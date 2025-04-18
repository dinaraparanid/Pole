import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_bloc_factory.dart';
import 'package:pole/feature/main/presentation/bloc/main_cubit_factory.dart';
import 'package:pole/feature/root/presentation/bloc/root_event.dart';
import 'package:pole/feature/root/domain/entity/root_route.dart';
import 'package:pole/feature/root/domain/use_case/initial_screen_use_case.dart';
import 'package:pole/feature/splash/presentation/bloc/mod.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class RootBloc extends Bloc<RootEvent, void> {
  RootBloc({
    required AppRouter router,
    required InitialScreenUseCase initialScreenUseCase,
    required SplashBlocFactory splashBlocFactory,
    required AuthBlocFactory authBlocFactory,
    required MainCubitFactory mainBlocFactory,
  }) : super(null) {

    on<NavigateToSplash>((event, emit) =>
      router.value.replaceNamed(AppRoute.splash.name),
    );

    on<NavigateToAuth>((event, emit) =>
      router.value.replaceNamed(AppRoute.auth.name, extra: event.route),
    );

    on<NavigateToMain>((event, emit) =>
      router.value.replaceNamed(AppRoute.main.name),
    );

    initialScreenUseCase
      .initialScreen
      .then((initialRoot) => switch (initialRoot) {
        RootRoute.splash || RootRoute.auth => add(NavigateToSplash()),
        RootRoute.main => add(NavigateToMain()),
      });
  }
}
