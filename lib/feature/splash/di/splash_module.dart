import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/splash/presentation/bloc/splash_bloc_factory.dart';

extension SplashModule on GetIt {
  List<Type> registerSplashModule() => [
    provideSingleton<SplashBlocFactory>(() => SplashBlocFactory(
      router: this(),
    )),
  ];
}
