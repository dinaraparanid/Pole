import 'package:dartx/dartx.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/feature/excursions/child/planning/domain/change_place_category_selection_use_case.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_event.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_state.dart';

final class PlanningBloc extends Bloc<PlanningEvent, PlanningState> {
  final void Function() _onResult;

  PlanningBloc({
    required ChangePlaceCategorySelectionUseCase changePlaceCategorySelectionUseCase,
    required TextChangeUseCase textChangeUseCase,
    required City city,
    required DateTime date,
    required void Function() onResult,
  }) : _onResult = onResult,
    super(PlanningState()) {

    on<ChangeExcursionName>((event, emit) {
      textChangeUseCase.execute(
        next: event.name,
        errorPredicate: (txt) => txt.isBlank,
        update: (textContainer) =>
          emit(state.copyWith(excursionName: textContainer)),
      );
    });

    on<ShowPlaceSelector>((event, emit) {
      // TODO
    });

    on<ChangePlaceCategorySelection>((event, emit) =>
      changePlaceCategorySelectionUseCase.execute(
        category: event.category,
        currentSelected: state.selectedCategories,
        updateSelection: (newSelected) =>
          emit(state.copyWith(selectedCategories: newSelected)),
      ),
    );

    on<SetVisitDuration>((event, emit) {
      // TODO
    });

    on<ConfirmPlace>((event, emit) {
      // TODO
    });

    on<RemovePlace>((event, emit) {
      // TODO
    });

    on<ConfirmDayPlan>((event, emit) {
      // TODO
    });
  }
}