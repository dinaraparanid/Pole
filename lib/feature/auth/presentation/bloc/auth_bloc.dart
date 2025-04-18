import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/auth/domain/navigate_to_auth_screen_use_case.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_route.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_event.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_state.dart';

final class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final NavigateToAuthScreenUseCase _navigateToAuthScreenUseCase;

  AuthBloc({
    required NavigateToAuthScreenUseCase navigateToAuthScreenUseCase,
    required AuthRoute route,
  }) : _navigateToAuthScreenUseCase = navigateToAuthScreenUseCase,
    super(AuthState(route: route)) {

    on<NavigateToSignIn>((event, emit) =>
      emit(state.copyWith(route: AuthRoute.signIn)),
    );

    on<NavigateToSignUp>((event, emit) =>
      emit(state.copyWith(route: AuthRoute.signUp)),
    );

    _listenScreenChanges();
  }

  void _listenScreenChanges() {
    stream.map((s) => s.route).distinct().listen((route) =>
      _redirectToRoute(route: route),
    );
  }

  void _redirectToRoute({required AuthRoute route}) =>
    _navigateToAuthScreenUseCase.execute(
      screen: route,
      authBloc: this,
    );
}
