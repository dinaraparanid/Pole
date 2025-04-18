import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:pole/navigation/app_router.dart';

final class SignInBlocFactory {
  final AppRouter _router;
  final TextChangeUseCase _textChangeUseCase;

  SignInBlocFactory({
    required AppRouter router,
    required TextChangeUseCase textChangeUseCase,
  }) : _router = router, _textChangeUseCase = textChangeUseCase;

  SignInBloc create() => SignInBloc(
    router: _router,
    textChangeUseCase: _textChangeUseCase,
  );
}
