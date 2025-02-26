import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/root/presentation/bloc/root_event.dart';
import 'package:pole/feature/root/domain/entity/root_screen.dart';
import 'package:pole/feature/root/domain/use_case/initial_screen_use_case.dart';
import 'package:pole/feature/splash/presentation/bloc/mod.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class RootBloc extends Bloc<RootEvent, void> {
  final SplashBlocFactory _splashBlocFactory;

  RootBloc({
    required AppRouter router,
    required InitialScreenUseCase initialScreenUseCase,
    required SplashBlocFactory splashBlocFactory,
  }) : _splashBlocFactory = splashBlocFactory,
    super(null) {

    on<NavigateToSplash>((event, emit) {
      final splashBloc = _createSplashBloc();
      router.value.replaceNamed(AppRoute.splash.name, extra: splashBloc);
    });

    on<NavigateToAuth>((event, emit) {
      // TODO auth bloc
      router.value.replaceNamed(AppRoute.auth.name);
    });

    on<NavigateToMain>((event, emit) {
      // TODO main bloc
      router.value.replaceNamed(AppRoute.main.name);
    });

    initialScreenUseCase
      .initialScreen
      .then((initialRoot) => switch (initialRoot) {
        RootScreen.splash => add(NavigateToSplash()),
        RootScreen.auth => add(NavigateToAuth()),
        RootScreen.main => add(NavigateToMain()),
      });
  }

  SplashBloc _createSplashBloc() => _splashBlocFactory.create(
    onDone: () => add(NavigateToAuth()),
  );
}
