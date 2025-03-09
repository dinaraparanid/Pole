import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/auth/child/sign_up/di/sign_up_module.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_bloc_factory.dart';

extension AuthModule on GetIt {
  List<Type> registerAuthModule() => [
    ...registerSignUpModule(),
    provideSingleton<AuthBlocFactory>(() => AuthBlocFactory(
      router: this(),
      signUpBlocFactory: this(),
    )),
  ];
}
