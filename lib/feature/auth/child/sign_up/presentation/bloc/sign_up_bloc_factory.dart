import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/sign_up_result.dart';

final class SignUpBlocFactory {
  final TextChangeUseCase _textChangeUseCase;

  SignUpBlocFactory({
    required TextChangeUseCase textChangeUseCase,
  }) : _textChangeUseCase = textChangeUseCase;

  SignUpBloc create({
    required void Function(SignUpResult) onDone,
  }) => SignUpBloc(
    textChangeUseCase: _textChangeUseCase,
    onDone: onDone,
  );
}
