import 'package:pole/feature/root/presentation/bloc/root_bloc.dart';
import 'package:pole/feature/root/domain/use_case/initial_screen_use_case.dart';
import 'package:pole/feature/splash/presentation/bloc/splash_bloc_factory.dart';
import 'package:pole/navigation/app_router.dart';

final class RootBlocFactory {
  final AppRouter _router;
  final InitialScreenUseCase _initialScreenUseCase;
  final SplashBlocFactory _splashBlocFactory;

  RootBlocFactory({
    required AppRouter router,
    required InitialScreenUseCase initialScreenUseCase,
    required SplashBlocFactory splashBlocFactory,
  }) : _router = router,
    _initialScreenUseCase = initialScreenUseCase,
    _splashBlocFactory = splashBlocFactory;

  RootBloc create() => RootBloc(
    router: _router,
    initialScreenUseCase: _initialScreenUseCase,
    splashBlocFactory: _splashBlocFactory,
  );
}
