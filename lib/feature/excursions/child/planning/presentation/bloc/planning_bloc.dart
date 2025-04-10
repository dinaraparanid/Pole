import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_effect.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_event.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_state.dart';

final class PlanningBloc extends Bloc<PlanningEvent, PlanningState>
  with BlocPresentationMixin<PlanningState, PlanningEffect> {

  final PlaceSelectorBlocFactory _placeSelectorBlocFactory;
  final void Function() _onResult;

  PlanningBloc({
    required TextChangeUseCase textChangeUseCase,
    required PlaceSelectorBlocFactory placeSelectorBlocFactory,
    required City city,
    required DateTime date,
    required void Function() onResult,
  }) : _onResult = onResult,
    _placeSelectorBlocFactory = placeSelectorBlocFactory,
    super(PlanningState()) {

    on<ChangeExcursionName>((event, emit) {
      textChangeUseCase.execute(
        next: event.name,
        errorPredicate: (txt) => txt.isBlank,
        update: (textContainer) =>
          emit(state.copyWith(excursionName: textContainer)),
      );
    });

    on<ShowPlaceSelector>((event, emit) =>
      emitPresentation(ShowPlaceSelectorBottomSheet(
        bloc: _createPlaceSelectorBloc(startTime: event.startTime)
      )),
    );

    on<RemovePlace>((event, emit) {
      // TODO
    });

    on<ConfirmDayPlan>((event, emit) {
      // TODO
    });
  }

  PlaceSelectorBloc _createPlaceSelectorBloc({required DateTime startTime}) =>
    _placeSelectorBlocFactory.create(
      startTime: startTime,
      availableCategories: state.allCategories,
    );
}
