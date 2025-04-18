import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/mod.dart';

extension SignUpModule on GetIt {
  List<Type> registerSignUpModule() => [
    provideSingleton<SignUpBlocFactory>(() => SignUpBlocFactory(
      router: this(),
      textChangeUseCase: this(),
    )),
  ];
}
