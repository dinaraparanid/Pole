import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/feature/excursions/child/planning/domain/change_place_category_selection_use_case.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_bloc.dart';

final class PlanningBlocFactory {
  final ChangePlaceCategorySelectionUseCase _changePlaceCategorySelectionUseCase;
  final TextChangeUseCase _textChangeUseCase;

  PlanningBlocFactory({
    required ChangePlaceCategorySelectionUseCase changePlaceCategorySelectionUseCase,
    required TextChangeUseCase textChangeUseCase,
  }) : _changePlaceCategorySelectionUseCase = changePlaceCategorySelectionUseCase,
    _textChangeUseCase = textChangeUseCase;

  PlanningBloc create({
    required City city,
    required DateTime date,
    required void Function() onResult,
  }) => PlanningBloc(
    changePlaceCategorySelectionUseCase: _changePlaceCategorySelectionUseCase,
    textChangeUseCase: _textChangeUseCase,
    city: city,
    date: date,
    onResult: onResult,
  );
}
