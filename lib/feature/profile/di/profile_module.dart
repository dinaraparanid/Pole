import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/profile/child/tours/di/tours_module.dart';
import 'package:pole/feature/profile/presentation/bloc/profile_bloc_factory.dart';

extension ProfileModule on GetIt {
  List<Type> registerProfileModule() => [
    ...registerToursModule(),

    provideSingleton(() => ProfileBlocFactory(
      profileChangesUseCase: this(),
      logOutUseCase: this(),
    )),
  ];
}
