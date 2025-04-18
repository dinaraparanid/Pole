import 'package:pole/feature/splash/presentation/bloc/splash_bloc.dart';
import 'package:pole/navigation/app_router.dart';

final class SplashBlocFactory {
  final AppRouter _router;

  SplashBlocFactory({required AppRouter router}) : _router = router;

  SplashBloc create() => SplashBloc(router: _router);
}
