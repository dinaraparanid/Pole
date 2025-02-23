import 'package:get_it/get_it.dart';

extension Provide on GetIt {
  Type provideSingleton<T extends Object>(T Function() factory) {
    registerLazySingleton(factory);
    return T;
  }

  Type provideFactory<T extends Object>(T Function() factory) {
    registerFactory(factory);
    return T;
  }
}
