import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/utils/ext/bool.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_bloc.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_bloc_factory.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_event.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_state.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_step.dart';
import 'package:pole/feature/excursions/presentation/domain/navigate_to_excursion_step_use_case.dart';
import 'package:pole/feature/excursions/rooting/excursions_extra.dart';
import 'package:pole/feature/main/presentation/bloc/main_bloc.dart';
import 'package:pole/feature/main/routing/main_extra.dart';

final class ExcursionsBloc extends Bloc<ExcursionsEvent, ExcursionsState> {
  final DateSelectionBlocFactory _dateSelectionBlocFactory;
  final NavigateToExcursionStepUseCase _navigateToExcursionStepUseCase;

  StreamSubscription<ExcursionsStep>? _stepChangesListener;

  late final DateSelectionBloc _dateSelectionBloc = _dateSelectionBlocFactory.create(
    onResult: () => add(UpdateStep(step: ExcursionsStep.planning)),
  );

  ExcursionsBloc({
    required MainBloc mainBloc,
    required DateSelectionBlocFactory dateSelectionBlocFactory,
    required NavigateToExcursionStepUseCase navigateToExcursionStepUseCase,
  }) : _dateSelectionBlocFactory = dateSelectionBlocFactory,
    _navigateToExcursionStepUseCase = navigateToExcursionStepUseCase,
    super(ExcursionsState()) {

    on<UpdateStep>((event, emit) => emit(state.copyWith(step: event.step)));

    _listenStepChanges(mainBloc: mainBloc);
  }

  @override
  Future<void> close() {
    _stepChangesListener?.cancel();
    return super.close();
  }

  MainExtra redirectExtra({required MainBloc mainBloc}) => MainExtra(
    mainBloc: mainBloc,
    excursionsExtra: switch (state.step) {
      ExcursionsStep.dateSelection => ExcursionsExtra(
        excursionsBloc: this,
        dateSelectionBloc: _dateSelectionBloc,
      ),

      ExcursionsStep.planning => ExcursionsExtra(
        excursionsBloc: this,
      ),

      ExcursionsStep.overview => ExcursionsExtra(
        excursionsBloc: this,
      ),
    },
  );

  void _listenStepChanges({required MainBloc mainBloc}) =>
    _stepChangesListener = stream.map((s) => s.step).distinct().listen((step) =>
      _redirectToStep(mainBloc: mainBloc, step: step),
    );

  void _redirectToStep({
    required MainBloc mainBloc,
    required ExcursionsStep step,
  }) => _navigateToExcursionStepUseCase.execute(
    step: step,
    mainBloc: mainBloc,
    excursionsBloc: this,
    dateSelectionBlocFactory: () => _dateSelectionBloc,
  );
}
