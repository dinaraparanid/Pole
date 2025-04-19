import 'package:get_it/get_it.dart';
import 'package:pole/core/data/auth/auth_interceptor.dart';
import 'package:pole/core/data/auth/auth_store.dart';
import 'package:pole/core/di/provide.dart';

extension AuthDataModule on GetIt {
  List<Type> registerAuthDataModule() => [
    provideSingleton(() => AuthInterceptor(store: this())),
    provideSingleton(() => AuthStore()),
  ];
}
