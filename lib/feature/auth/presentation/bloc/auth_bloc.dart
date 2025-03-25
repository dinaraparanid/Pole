import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/bloc/mod.dart' as si;
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/mod.dart' as su;
import 'package:pole/feature/auth/domain/start_screen.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_event.dart';
import 'package:pole/feature/auth/routing/auth_extra.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class AuthBloc extends Bloc<AuthEvent, void> {
  final si.SignInBlocFactory _signInBlocFactory;
  final su.SignUpBlocFactory _signUpBlocFactory;
  final void Function() _onDone;

  AuthBloc({
    required AppRouter router,
    required si.SignInBlocFactory signInBlocFactory,
    required su.SignUpBlocFactory signUpBlocFactory,
    required StartScreen startScreen,
    required void Function() onDone,
  }) : _onDone = onDone,
    _signInBlocFactory = signInBlocFactory,
    _signUpBlocFactory = signUpBlocFactory,
    super(null) {

    on<NavigateToSignIn>((event, emit) {
      final signInBloc = _createSignInBloc();
      router.value.replaceNamed(
        AppRoute.signIn.name,
        extra: AuthExtra(authBloc: this, signInBloc: signInBloc),
      );
    });

    on<NavigateToSignUp>((event, emit) {
      final signUpBloc = _createSignUpBloc();
      router.value.replaceNamed(
        AppRoute.signUp.name,
        extra: AuthExtra(authBloc: this, signUpBloc: signUpBloc),
      );
    });

    switch (startScreen) {
      case StartScreen.sign_in: add(NavigateToSignIn());
      case StartScreen.sign_up: add(NavigateToSignUp());
    }
  }

  si.SignInBloc _createSignInBloc() => _signInBlocFactory.create(
    onDone: (result) => switch (result) {
      si.NavigateToSignUp() => add(NavigateToSignUp()),
      si.SignedIn() => _onDone(),
    },
  );

  su.SignUpBloc _createSignUpBloc() => _signUpBlocFactory.create(
    onDone: (result) => switch (result) {
      su.NavigateToSignIn() => add(NavigateToSignIn()),
      su.SignedUp() => _onDone(),
    },
  );
}
