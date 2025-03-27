import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/excursions/child/date_selection/di/date_selection_module.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_bloc_factory.dart';
import 'package:pole/feature/excursions/presentation/domain/navigate_to_excursion_step_use_case.dart';

extension ExcursionsModule on GetIt {
  List<Type> registerExcursionsModule() => [
    ...registerDateSelectionModule(),
    provideSingleton<ExcursionsBlocFactory>(() => ExcursionsBlocFactory(
      dateSelectionBlocFactory: this(),
      navigateToExcursionStepUseCase: this(),
    )),
    provideSingleton<NavigateToExcursionStepUseCase>(() =>
      NavigateToExcursionStepUseCase(router: this()),
    ),
  ];
}
