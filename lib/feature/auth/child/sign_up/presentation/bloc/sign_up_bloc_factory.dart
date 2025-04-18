import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:pole/navigation/app_router.dart';

final class SignUpBlocFactory {
  final AppRouter _router;
  final TextChangeUseCase _textChangeUseCase;

  SignUpBlocFactory({
    required AppRouter router,
    required TextChangeUseCase textChangeUseCase,
  }) : _router = router, _textChangeUseCase = textChangeUseCase;

  SignUpBloc create() => SignUpBloc(
    router: _router,
    textChangeUseCase: _textChangeUseCase,
  );
}
