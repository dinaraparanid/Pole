import 'package:get_it/get_it.dart';
import 'package:pole/core/data/auth/auth_interceptor.dart';
import 'package:pole/core/data/auth/data_source/auth_store_impl.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/core/domain/auth/data_source/auth_store.dart';

extension AuthDataModule on GetIt {
  List<Type> registerAuthDataModule() => [
    provideSingleton(() => AuthInterceptor(
      store: this(),
      logOutUseCase: this(),
    )),

    provideSingleton<AuthStore>(() => AuthStoreImpl()),
  ];
}
