import 'package:pole/feature/auth/child/sign_up/presentation/bloc/sign_up_bloc_factory.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/bloc/sign_in_bloc_factory.dart';
import 'package:pole/feature/auth/domain/start_screen.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:pole/navigation/app_router.dart';

final class AuthBlocFactory {
  final SignInBlocFactory _signInBlocFactory;
  final SignUpBlocFactory _signUpBlocFactory;
  final AppRouter _router;

  AuthBlocFactory({
    required AppRouter router,
    required SignInBlocFactory signInBlocFactory,
    required SignUpBlocFactory signUpBlocFactory,
  }) : _router = router,
    _signInBlocFactory = signInBlocFactory,
    _signUpBlocFactory = signUpBlocFactory;

  AuthBloc create({
    required StartScreen startScreen,
    required void Function() onDone,
  }) => AuthBloc(
    router: _router,
    signInBlocFactory: _signInBlocFactory,
    signUpBlocFactory: _signUpBlocFactory,
    startScreen: startScreen,
    onDone: onDone,
  );
}
