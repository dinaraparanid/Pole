import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_event.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_state.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_step.dart';
import 'package:pole/feature/excursions/domain/navigate_to_excursion_step_use_case.dart';
import 'package:pole/feature/excursions/rooting/excursions_extra.dart';
import 'package:pole/feature/main/presentation/bloc/main_bloc.dart';
import 'package:pole/feature/main/routing/main_extra.dart';

final class ExcursionsBloc extends Bloc<ExcursionsEvent, ExcursionsState> {
  final DateSelectionBlocFactory _dateSelectionBlocFactory;
  final PlanningBlocFactory _planningBlocFactory;
  final NavigateToExcursionStepUseCase _navigateToExcursionStepUseCase;

  StreamSubscription<ExcursionsStep>? _stepChangesListener;

  DateSelectionBloc? _dateSelectionBloc;
  PlanningBloc? _planningBloc;

  ExcursionsBloc({
    required MainBloc mainBloc,
    required DateSelectionBlocFactory dateSelectionBlocFactory,
    required PlanningBlocFactory planningBlocFactory,
    required NavigateToExcursionStepUseCase navigateToExcursionStepUseCase,
  }) : _dateSelectionBlocFactory = dateSelectionBlocFactory,
    _planningBlocFactory = planningBlocFactory,
    _navigateToExcursionStepUseCase = navigateToExcursionStepUseCase,
    super(ExcursionsState()) {

    on<UpdateStep>((event, emit) {
      _dateSelectionBloc?.close();
      _dateSelectionBloc = null;

      _planningBloc?.close();
      _planningBloc = null;

      emit(state.copyWith(step: event.step));
    });

    _listenStepChanges(mainBloc: mainBloc);
  }

  @override
  Future<void> close() {
    _stepChangesListener?.cancel();
    return super.close();
  }

  MainExtra redirectExtra({required MainBloc mainBloc}) {
    _initStepBloc(step: state.step);

    return MainExtra(
      mainBloc: mainBloc,
      excursionsExtra: switch (state.step) {
        DateSelection() => ExcursionsExtra(
          excursionsBloc: this,
          dateSelectionBloc: _dateSelectionBloc,
        ),

        Planning() => ExcursionsExtra(
          excursionsBloc: this,
          planningBloc: _planningBloc,
        ),

        Overview() => ExcursionsExtra(
          excursionsBloc: this,
        ),
      },
    );
  }

  void _listenStepChanges({required MainBloc mainBloc}) =>
    _stepChangesListener = stream.map((s) => s.step).distinct().listen((step) =>
      _redirectToStep(mainBloc: mainBloc, step: step),
    );

  void _redirectToStep({
    required MainBloc mainBloc,
    required ExcursionsStep step,
  }) {
    _initStepBloc(step: step);

    _navigateToExcursionStepUseCase.execute(
      step: step,
      mainBloc: mainBloc,
      excursionsBloc: this,
      dateSelectionBlocFactory: () => _dateSelectionBloc!,
      planningBlocFactory: () => _planningBloc!,
    );
  }

  void _initStepBloc({required ExcursionsStep step}) {
    switch (step) {
      case DateSelection():
        _dateSelectionBloc = _dateSelectionBlocFactory.create(
          onResult: (result) => add(UpdateStep(
            step: ExcursionsStep.planning(
              city: result.selectedCity,
              date: result.selectedDate,
            ),
          )),
        );

      case Planning():
        _planningBloc = _planningBlocFactory.create(
          city: step.city,
          date: step.date,
          onResult: () => add(UpdateStep(
            step: ExcursionsStep.overview(
              city: step.city,
              date: step.date,
            ),
          )),
        );

      case Overview(): // TODO
    }
  }
}
