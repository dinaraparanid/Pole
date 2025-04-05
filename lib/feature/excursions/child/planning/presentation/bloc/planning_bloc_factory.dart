import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/feature/excursions/child/planning/domain/change_place_category_selection_use_case.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_bloc.dart';

final class PlanningBlocFactory {
  final ChangePlaceCategorySelectionUseCase _changePlaceCategorySelectionUseCase;

  PlanningBlocFactory({
    required ChangePlaceCategorySelectionUseCase changePlaceCategorySelectionUseCase,
  }) : _changePlaceCategorySelectionUseCase = changePlaceCategorySelectionUseCase;

  PlanningBloc create({
    required City city,
    required DateTime date,
    required void Function() onResult,
  }) => PlanningBloc(
    changePlaceCategorySelectionUseCase: _changePlaceCategorySelectionUseCase,
    city: city,
    date: date,
    onResult: onResult,
  );
}
