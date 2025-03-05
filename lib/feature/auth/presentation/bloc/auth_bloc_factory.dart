import 'package:pole/feature/auth/domain/start_screen.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:pole/navigation/app_router.dart';

final class AuthBlocFactory {
  final AppRouter _router;

  AuthBlocFactory({
    required AppRouter router,
  }) : _router = router;

  AuthBloc create({
    required StartScreen startScreen,
    required void Function() onDone,
  }) => AuthBloc(
    router: _router,
    startScreen: startScreen,
    onDone: onDone,
  );
}
