import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/core/utils/ext/bool.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/sign_up_effect.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/sign_up_event.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/sign_up_state.dart';
import 'package:pole/feature/auth/domain/sign_up_use_case.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_route.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class SignUpBloc extends Bloc<SignUpEvent, SignUpState>
  with BlocPresentationMixin<SignUpState, SignUpEffect> {

  SignUpBloc({
    required AppRouter router,
    required SignUpUseCase signUpUseCase,
    required TextChangeUseCase textChangeUseCase,
  }) : super(SignUpState()) {
    on<SignInClick>((event, emit) =>
      router.value.replaceNamed(AppRoute.signIn.name, extra: AuthRoute.signIn)
    );

    on<ConfirmClick>((event, emit) async {
      emit(state.copyWith(isConfirmButtonLoading: true));

      await signUpUseCase(
        name: state.name.value,
        email: state.email.value,
        password: state.password.value,
        onSuccess: () => emit(state.copyWith(isConfirmButtonLoading: false)),
        onFailure: (_) {
          emitPresentation(ShowFailedToSignUpDialogEffect());
          emit(state.copyWith(isConfirmButtonLoading: false));
        },
      );
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
        update: (textContainer) =>
          emit(state.copyWith(password: textContainer)),
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
