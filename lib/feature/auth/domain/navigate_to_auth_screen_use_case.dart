import 'package:pole/feature/auth/presentation/bloc/auth_route.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class NavigateToAuthScreenUseCase {
  final AppRouter _router;

  NavigateToAuthScreenUseCase({required AppRouter router}) : _router = router;

  void execute({
    required AuthRoute screen,
    required AuthBloc authBloc,
  }) => switch (screen) {
    AuthRoute.signIn => _router.value.replaceNamed(AppRoute.signIn.name),
    AuthRoute.signUp => _router.value.replaceNamed(AppRoute.signUp.name),
  };
}
