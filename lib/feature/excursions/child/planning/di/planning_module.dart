import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/excursions/child/planning/domain/change_place_category_selection_use_case.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_bloc_factory.dart';

extension PlanningModule on GetIt {
  List<Type> registerPlanningModule() => [
    provideSingleton<ChangePlaceCategorySelectionUseCase>(() =>
      ChangePlaceCategorySelectionUseCase(),
    ),
    provideSingleton<PlanningBlocFactory>(() =>
      PlanningBlocFactory(
        changePlaceCategorySelectionUseCase: this(),
        textChangeUseCase: this(),
      ),
    ),
  ];
}
