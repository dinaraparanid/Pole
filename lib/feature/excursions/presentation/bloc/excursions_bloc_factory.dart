import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_bloc_factory.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_bloc_factory.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_bloc.dart';
import 'package:pole/feature/excursions/domain/navigate_to_excursion_step_use_case.dart';
import 'package:pole/feature/main/presentation/bloc/main_bloc.dart';

final class ExcursionsBlocFactory {
  final DateSelectionBlocFactory _dateSelectionBlocFactory;
  final PlanningBlocFactory _planningBlocFactory;
  final NavigateToExcursionStepUseCase _navigateToExcursionStepUseCase;

  ExcursionsBlocFactory({
    required DateSelectionBlocFactory dateSelectionBlocFactory,
    required PlanningBlocFactory planningBlocFactory,
    required NavigateToExcursionStepUseCase navigateToExcursionStepUseCase,
  }) : _dateSelectionBlocFactory = dateSelectionBlocFactory,
    _planningBlocFactory = planningBlocFactory,
    _navigateToExcursionStepUseCase = navigateToExcursionStepUseCase;

  ExcursionsBloc create({required MainBloc mainBloc}) => ExcursionsBloc(
    mainBloc: mainBloc,
    dateSelectionBlocFactory: _dateSelectionBlocFactory,
    planningBlocFactory: _planningBlocFactory,
    navigateToExcursionStepUseCase: _navigateToExcursionStepUseCase,
  );
}
