import 'package:pole/feature/auth/presentation/bloc/auth_route.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:pole/navigation/app_router.dart';

final class AuthBlocFactory {
  final AppRouter _router;

  AuthBlocFactory({required AppRouter router}) : _router = router;

  AuthBloc create({required AuthRoute route}) =>
    AuthBloc(router: _router, route: route);
}
