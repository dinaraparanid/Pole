import 'package:dartx/dartx.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/bloc/sign_in_event.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/bloc/sign_in_state.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_route.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AppRouter _router;

  SignInBloc({
    required AppRouter router,
    required TextChangeUseCase textChangeUseCase,
  }) : _router = router, super(SignInState()) {
    on<SignUpClick>((event, emit) =>
      _router.value.replaceNamed(AppRoute.signUp.name, extra: AuthRoute.signUp),
    );

    on<ConfirmClick>((event, emit) {
      // TODO check with api and show error
      _router.value.replaceNamed(AppRoute.main.name);
    });

    on<EmailChange>((event, emit) {
      textChangeUseCase.execute(
        next: event.email,
        errorPredicate: (txt) => txt.isBlank,
        update: (textContainer) => emit(state.copyWith(email: textContainer)),
      );
    });

    on<PasswordChange>((event, emit) {
      textChangeUseCase.execute(
        next: event.password,
        errorPredicate: (_) => false,
        update: (textContainer) => emit(state.copyWith(password: textContainer)),
      );
    });
  }
}
