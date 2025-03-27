import 'package:pole/feature/auth/child/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_screen.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:pole/feature/auth/routing/auth_extra.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class NavigateToAuthScreenUseCase {
  final AppRouter _router;

  NavigateToAuthScreenUseCase({required AppRouter router}) : _router = router;

  void execute({
    required AuthScreen screen,
    required AuthBloc authBloc,
    required SignInBloc Function() signInBlocFactory,
    required SignUpBloc Function() signUpBlocFactory,
  }) => switch (screen) {
    AuthScreen.signIn => _router.value.replaceNamed(
      AppRoute.signIn.name,
      extra: AuthExtra(authBloc: authBloc, signInBloc: signInBlocFactory()),
    ),

    AuthScreen.signUp => _router.value.replaceNamed(
      AppRoute.signUp.name,
      extra: AuthExtra(authBloc: authBloc, signUpBloc: signUpBlocFactory()),
    ),
  };
}
