import 'package:pole/feature/auth/child/sign_up/presentation/bloc/sign_up_bloc_factory.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/bloc/sign_in_bloc_factory.dart';
import 'package:pole/feature/auth/domain/navigate_to_auth_screen_use_case.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_screen.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_bloc.dart';

final class AuthBlocFactory {
  final SignInBlocFactory _signInBlocFactory;
  final SignUpBlocFactory _signUpBlocFactory;
  final NavigateToAuthScreenUseCase _navigateToAuthScreenUseCase;

  AuthBlocFactory({
    required SignInBlocFactory signInBlocFactory,
    required SignUpBlocFactory signUpBlocFactory,
    required NavigateToAuthScreenUseCase navigateToAuthScreenUseCase,
  }) : _signInBlocFactory = signInBlocFactory,
    _signUpBlocFactory = signUpBlocFactory,
    _navigateToAuthScreenUseCase = navigateToAuthScreenUseCase;

  AuthBloc create({
    required AuthScreen startScreen,
    required void Function() onDone,
  }) => AuthBloc(
    signInBlocFactory: _signInBlocFactory,
    signUpBlocFactory: _signUpBlocFactory,
    navigateToAuthScreenUseCase: _navigateToAuthScreenUseCase,
    startScreen: startScreen,
    onDone: onDone,
  );
}
