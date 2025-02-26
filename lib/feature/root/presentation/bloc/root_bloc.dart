import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/root/presentation/bloc/root_event.dart';
import 'package:pole/feature/root/domain/entity/root_screen.dart';
import 'package:pole/feature/root/domain/use_case/initial_screen_use_case.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class RootBloc extends Bloc<RootEvent, void> {
  RootBloc({
    required AppRouter router,
    required InitialScreenUseCase initialScreenUseCase,
  }) : super(null) {
    on<NavigateToSplash>((event, emit) {
      // TODO splash bloc
      router.value.replaceNamed(AppRoute.splash.name);
    });

    on<NavigateToMain>((event, emit) {
      // TODO main bloc
      router.value.replaceNamed(AppRoute.main.name);
    });

    initialScreenUseCase
      .initialScreen
      .then((initialRoot) => switch (initialRoot) {
        RootScreen.splash => add(NavigateToSplash()),
        RootScreen.main => add(NavigateToMain()),
      });
  }
}
