import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/bloc/sign_in_result.dart';

final class SignInBlocFactory {
  final TextChangeUseCase _textChangeUseCase;

  SignInBlocFactory({
    required TextChangeUseCase textChangeUseCase,
  }) : _textChangeUseCase = textChangeUseCase;

  SignInBloc create({
    required void Function(SignInResult) onDone,
  }) => SignInBloc(
    textChangeUseCase: _textChangeUseCase,
    onDone: onDone,
  );
}
