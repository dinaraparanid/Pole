import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/main/domain/navigate_to_main_tab_use_case.dart';
import 'package:pole/feature/main/presentation/bloc/main_bloc_factory.dart';

extension MainModule on GetIt {
  List<Type> registerMainModule() => [
    provideSingleton<MainBlocFactory>(() => MainBlocFactory(
      excursionsBlocFactory: this(),
      navigateToMainTabUseCase: this(),
    )),
    provideSingleton<NavigateToMainTabUseCase>(() =>
      NavigateToMainTabUseCase(router: this())
    ),
  ];
}
