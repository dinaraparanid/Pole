import 'package:pole/feature/auth/child/sign_up/presentation/bloc/sign_up_bloc_factory.dart';
import 'package:pole/feature/auth/domain/start_screen.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:pole/navigation/app_router.dart';

final class AuthBlocFactory {
  final SignUpBlocFactory _signUpBlocFactory;
  final AppRouter _router;

  AuthBlocFactory({
    required AppRouter router,
    required SignUpBlocFactory signUpBlocFactory,
  }) : _router = router,
    _signUpBlocFactory = signUpBlocFactory;

  AuthBloc create({
    required StartScreen startScreen,
    required void Function() onDone,
  }) => AuthBloc(
    router: _router,
    signUpBlocFactory: _signUpBlocFactory,
    startScreen: startScreen,
    onDone: onDone,
  );
}
