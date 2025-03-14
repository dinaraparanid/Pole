import 'package:dartx/dartx.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/bloc/sign_in_event.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/bloc/sign_in_result.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/bloc/sign_in_state.dart';

final class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final void Function(SignInResult) _onDone;

  SignInBloc({
    required TextChangeUseCase textChangeUseCase,
    required void Function(SignInResult) onDone,
  }) : _onDone = onDone, super(SignInState()) {
    on<SignUpClick>((event, emit) => _onDone(NavigateToSignUp()));

    on<ConfirmClick>((event, emit) {
      // TODO check with api and show error
      _onDone(SignedIn());
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
