import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:pole/feature/auth/domain/sign_up_use_case.dart';
import 'package:pole/navigation/app_router.dart';

final class SignUpBlocFactory {
  final AppRouter _router;
  final SignUpUseCase _signUpUseCase;
  final TextChangeUseCase _textChangeUseCase;

  SignUpBlocFactory({
    required AppRouter router,
    required SignUpUseCase signUpUseCase,
    required TextChangeUseCase textChangeUseCase,
  }) : _router = router,
    _signUpUseCase = signUpUseCase,
    _textChangeUseCase = textChangeUseCase;

  SignUpBloc create() => SignUpBloc(
    router: _router,
    signUpUseCase: _signUpUseCase,
    textChangeUseCase: _textChangeUseCase,
  );
}
