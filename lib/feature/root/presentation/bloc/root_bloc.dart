import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/auth/domain/start_screen.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_bloc_factory.dart';
import 'package:pole/feature/root/presentation/bloc/root_event.dart';
import 'package:pole/feature/root/domain/entity/root_screen.dart';
import 'package:pole/feature/root/domain/use_case/initial_screen_use_case.dart';
import 'package:pole/feature/splash/presentation/bloc/mod.dart';
import 'package:pole/feature/splash/presentation/bloc/splash_result.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class RootBloc extends Bloc<RootEvent, void> {
  final SplashBlocFactory _splashBlocFactory;
  final AuthBlocFactory _authBlocFactory;

  RootBloc({
    required AppRouter router,
    required InitialScreenUseCase initialScreenUseCase,
    required SplashBlocFactory splashBlocFactory,
    required AuthBlocFactory authBlocFactory,
  }) : _splashBlocFactory = splashBlocFactory,
    _authBlocFactory = authBlocFactory,
    super(null) {

    on<NavigateToSplash>((event, emit) {
      final splashBloc = _createSplashBloc();
      router.value.replaceNamed(AppRoute.splash.name, extra: splashBloc);
    });

    on<NavigateToAuth>((event, emit) {
      final authBloc = _createAuthBloc(event.screen);
      router.value.replaceNamed(AppRoute.auth.name, extra: authBloc);
    });

    on<NavigateToMain>((event, emit) {
      // TODO main bloc
      router.value.replaceNamed(AppRoute.main.name);
    });

    initialScreenUseCase
        .initialScreen
        .then((initialRoot) => switch (initialRoot) {
      RootScreen.splash || RootScreen.auth => add(NavigateToSplash()),
      RootScreen.main => add(NavigateToMain()),
    });
  }

  SplashBloc _createSplashBloc() => _splashBlocFactory.create(
    onDone: (result) => add(NavigateToAuth(
      screen: switch (result) {
        SignIn() => StartScreen.sign_in,
        SignUp() => StartScreen.sign_up,
      },
    )),
  );

  AuthBloc _createAuthBloc(StartScreen startScreen) => _authBlocFactory.create(
    startScreen: startScreen,
    onDone: () => add(NavigateToMain()),
  );
}
