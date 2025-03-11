import 'package:dartx/dartx.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/core/utils/ext/bool.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/sign_up_event.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/sign_up_result.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/sign_up_state.dart';

final class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final void Function(SignUpResult) _onDone;

  SignUpBloc({
    required TextChangeUseCase textChangeUseCase,
    required void Function(SignUpResult) onDone,
  }) : _onDone = onDone, super(SignUpState()) {
    on<SignInClick>((event, emit) => _onDone(NavigateToSignIn()));

    on<ConfirmClick>((event, emit) {
      // TODO check with api and show error
      _onDone(SignedUp());
    });

    on<NameChange>((event, emit) {
      textChangeUseCase.execute(
        next: event.name,
        errorPredicate: (txt) => txt.isBlank,
        update: (textContainer) => emit(state.copyWith(name: textContainer)),
      );
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
        errorPredicate: (txt) => state.isSmallForPassword(txt),
        update: (textContainer) => emit(state.copyWith(password: textContainer)),
      );
    });

    on<ConfirmPasswordChange>((event, emit) {
      textChangeUseCase.execute(
        next: event.password,
        errorPredicate: (txt) => state.matchesPassword(txt).not,
        update: (textContainer) =>
          emit(state.copyWith(confirmPassword: textContainer)),
      );
    });
  }
}
