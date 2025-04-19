import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_route.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_event.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_state.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AppRouter _router;

  StreamSubscription<AuthRoute>? _routeListener;

  AuthBloc({
    required AppRouter router,
    required AuthRoute route,
  }) : _router = router, super(AuthState(route: route)) {

    on<NavigateToSignIn>((event, emit) =>
      emit(state.copyWith(route: AuthRoute.signIn)),
    );

    on<NavigateToSignUp>((event, emit) =>
      emit(state.copyWith(route: AuthRoute.signUp)),
    );

    _listenScreenChanges();
  }

  @override
  Future<void> close() async {
    await _routeListener?.cancel();
    _routeListener = null;
    return super.close();
  }

  void _listenScreenChanges() {
    _routeListener = stream.map((s) => s.route).distinct().listen((route) =>
      _redirectToRoute(route: route),
    );
  }

  Future<void> _redirectToRoute({required AuthRoute route}) async {
    await _router.value.replaceNamed(
      switch (route) {
        AuthRoute.signIn => AppRoute.signIn.name,
        AuthRoute.signUp => AppRoute.signUp.name,
      }
    );
  }
}
