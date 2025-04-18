import 'package:pole/feature/auth/domain/navigate_to_auth_screen_use_case.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_route.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_bloc.dart';

final class AuthBlocFactory {
  final NavigateToAuthScreenUseCase _navigateToAuthScreenUseCase;

  AuthBlocFactory({
    required NavigateToAuthScreenUseCase navigateToAuthScreenUseCase,
  }) : _navigateToAuthScreenUseCase = navigateToAuthScreenUseCase;

  AuthBloc create({
    required AuthRoute route,
  }) => AuthBloc(
    navigateToAuthScreenUseCase: _navigateToAuthScreenUseCase,
    route: route,
  );
}
