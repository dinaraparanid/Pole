import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/di/place_selector_module.dart';
import 'package:pole/feature/excursions/child/planning/domain/calculate_max_visit_duration_use_case.dart';
import 'package:pole/feature/excursions/child/planning/domain/change_place_category_selection_use_case.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_bloc_factory.dart';

extension PlanningModule on GetIt {
  List<Type> registerPlanningModule() => [
    ...registerPlaceSelectorModule(),
    provideSingleton<SelectCategoryUseCase>(() =>
      SelectCategoryUseCase(),
    ),
    provideSingleton<CalculateMaxVisitDurationUseCase>(() =>
      CalculateMaxVisitDurationUseCase(),
    ),
    provideSingleton<PlanningBlocFactory>(() =>
      PlanningBlocFactory(
        placeSelectorBlocFactory: this(),
        textChangeUseCase: this(),
        calculateMaxVisitDurationUseCase: this(),
      ),
    ),
  ];
}
