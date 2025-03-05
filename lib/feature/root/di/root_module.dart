import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/root/domain/use_case/initial_screen_use_case.dart';
import 'package:pole/feature/root/presentation/bloc/root_bloc_factory.dart';

extension RootModule on GetIt {
  List<Type> registerRootModule() => [
    provideSingleton<InitialScreenUseCase>(() =>
      InitialScreenUseCase(),
    ),
    provideSingleton<RootBlocFactory>(() =>
      RootBlocFactory(
        router: this(),
        initialScreenUseCase: this(),
        splashBlocFactory: this(),
        authBlocFactory: this(),
      ),
    ),
  ];
}