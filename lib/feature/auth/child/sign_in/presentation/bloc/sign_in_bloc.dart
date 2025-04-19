import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/bloc/sign_in_effect.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/bloc/sign_in_event.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/bloc/sign_in_state.dart';
import 'package:pole/feature/auth/domain/sign_in_use_case.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_route.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class SignInBloc extends Bloc<SignInEvent, SignInState>
  with BlocPresentationMixin<SignInState, SignInEffect> {

  SignInBloc({
    required AppRouter router,
    required SignInUseCase signInUseCase,
    required TextChangeUseCase textChangeUseCase,
  }) : super(SignInState()) {
    on<SignUpClick>((event, emit) =>
      router.value.replaceNamed(AppRoute.signUp.name, extra: AuthRoute.signUp),
    );

    on<ConfirmClick>((event, emit) async {
      emit(state.copyWith(isConfirmButtonLoading: true));

      await signInUseCase(
        email: state.email.value,
        password: state.password.value,
        onSuccess: () => emit(state.copyWith(isConfirmButtonLoading: false)),
        onFailure: (_) {
          emitPresentation(ShowFailedToSignInDialogEffect());
          emit(state.copyWith(isConfirmButtonLoading: false));
        },
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
        errorPredicate: (_) => false,
        update: (textContainer) =>
          emit(state.copyWith(password: textContainer)),
      );
    });
  }
}
