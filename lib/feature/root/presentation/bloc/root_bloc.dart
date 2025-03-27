import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_screen.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_bloc_factory.dart';
import 'package:pole/feature/auth/routing/auth_extra.dart';
import 'package:pole/feature/main/presentation/bloc/main_bloc.dart';
import 'package:pole/feature/main/presentation/bloc/main_bloc_factory.dart';
import 'package:pole/feature/main/routing/main_extra.dart';
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
  final MainBlocFactory _mainBlocFactory;

  late final SplashBloc _splashBloc = _splashBlocFactory.create(
    onDone: (result) => add(NavigateToAuth(
      screen: switch (result) {
        SignIn() => AuthScreen.signIn,
        SignUp() => AuthScreen.signUp,
      },
    )),
  );

  late final MainBloc _mainBloc = _mainBlocFactory.create();

  RootBloc({
    required AppRouter router,
    required InitialScreenUseCase initialScreenUseCase,
    required SplashBlocFactory splashBlocFactory,
    required AuthBlocFactory authBlocFactory,
    required MainBlocFactory mainBlocFactory,
  }) : _splashBlocFactory = splashBlocFactory,
    _authBlocFactory = authBlocFactory,
    _mainBlocFactory = mainBlocFactory,
    super(null) {

    on<NavigateToSplash>((event, emit) =>
      router.value.replaceNamed(
        AppRoute.splash.name,
        extra: _splashBloc,
      ),
    );

    on<NavigateToAuth>((event, emit) {
      final authBloc = _createAuthBloc(event.screen);
      router.value.replaceNamed(
        AppRoute.auth.name,
        extra: AuthExtra(authBloc: authBloc),
      );
    });

    on<NavigateToMain>((event, emit) =>
      router.value.replaceNamed(
        AppRoute.main.name,
        extra: MainExtra(mainBloc: _mainBloc),
      ),
    );

    initialScreenUseCase
      .initialScreen
      .then((initialRoot) => switch (initialRoot) {
        RootScreen.splash || RootScreen.auth => add(NavigateToSplash()),
        RootScreen.main => add(NavigateToMain()),
      });
  }

  AuthBloc _createAuthBloc(AuthScreen startScreen) => _authBlocFactory.create(
    startScreen: startScreen,
    onDone: () => add(NavigateToMain()),
  );
}
