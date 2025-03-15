import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/main/presentation/bloc/main_bloc_factory.dart';

extension MainModule on GetIt {
  List<Type> registerMainModule() => [
    provideSingleton<MainBlocFactory>(() => MainBlocFactory()),
  ];
}
