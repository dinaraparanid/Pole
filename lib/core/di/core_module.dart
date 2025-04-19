import 'package:get_it/get_it.dart';
import 'package:pole/core/data/account/di/account_module.dart';
import 'package:pole/core/data/auth/di/auth_data_module.dart';
import 'package:pole/core/data/base_dio.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/core/domain/text/text_change_use_case.dart';

extension CoreModule on GetIt {
  List<Type> registerCoreModule() => [
    ...registerAuthDataModule(),
    ...registerAccountModule(),
    provideSingleton(() => TextChangeUseCase()),
    provideSingleton(() => BaseDio(
      authInterceptor: this(),
    )),
  ];
}
