import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/auth/child/sign_in/presentation/bloc/mod.dart';

extension SignInModule on GetIt {
  List<Type> registerSignInModule() => [
    provideSingleton<SignInBlocFactory>(() => SignInBlocFactory(
      router: this(),
      textChangeUseCase: this(),
    )),
  ];
}
