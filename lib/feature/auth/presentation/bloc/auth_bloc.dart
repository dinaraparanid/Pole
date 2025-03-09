import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/mod.dart' as su;
import 'package:pole/feature/auth/domain/start_screen.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_event.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class AuthBloc extends Bloc<AuthEvent, void> {
  final su.SignUpBlocFactory _signUpBlocFactory;
  final void Function() _onDone;

  AuthBloc({
    required AppRouter router,
    required su.SignUpBlocFactory signUpBlocFactory,
    required StartScreen startScreen,
    required void Function() onDone,
  }) : _onDone = onDone,
    _signUpBlocFactory = signUpBlocFactory,
    super(null) {

    on<NavigateToSignIn>((event, emit) {

    });

    on<NavigateToSignUp>((event, emit) {
      final signUpBloc = _createSignUpBloc();
      router.value.replaceNamed(AppRoute.signUp.name, extra: signUpBloc);
    });

    switch (startScreen) {
      case StartScreen.sign_in: add(NavigateToSignIn());
      case StartScreen.sign_up: add(NavigateToSignUp());
    }
  }

  su.SignUpBloc _createSignUpBloc() => _signUpBlocFactory.create(
    onDone: (result) => switch (result) {
      su.NavigateToSignIn() => add(NavigateToSignIn()),
      su.SignedUp() => _onDone(),
    },
  );
}
