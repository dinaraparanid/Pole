import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/root/presentation/bloc/root_bloc_factory.dart';

extension RootModule on GetIt {
  List<Type> registerRootModule() => [
    provideSingleton<RootBlocFactory>(() =>
      RootBlocFactory(router: this(), authStore: this()),
    ),
  ];
}
