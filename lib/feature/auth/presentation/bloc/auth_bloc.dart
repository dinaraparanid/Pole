import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/auth/domain/start_screen.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_event.dart';
import 'package:pole/navigation/app_router.dart';

final class AuthBloc extends Bloc<AuthEvent, void> {
  final void Function() _onDone;

  AuthBloc({
    required AppRouter router,
    required StartScreen startScreen,
    required void Function() onDone,
  }) : _onDone = onDone,
    super(null) {

    on<NavigateToSignIn>((event, emit) {

    });

    on<NavigateToSignUp>((event, emit) {

    });
  }
}
