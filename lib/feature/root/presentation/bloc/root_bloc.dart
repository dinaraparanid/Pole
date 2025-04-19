import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/auth/data_source/auth_store.dart';
import 'package:pole/feature/root/presentation/bloc/root_event.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class RootBloc extends Bloc<RootEvent, void> {
  StreamSubscription<bool>? _authorizedListener;

  RootBloc({
    required AppRouter router,
    required AuthStore authStore,
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

    _authorizedListener = authStore.authorizedStream.listen((isAuthorized) =>
      add(isAuthorized ? NavigateToMain() : NavigateToSplash()),
    );
  }

  @override
  Future<void> close() async {
    await _authorizedListener?.cancel();
    _authorizedListener = null;
    return super.close();
  }
}
