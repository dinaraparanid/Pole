import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_bloc_factory.dart';
import 'package:pole/feature/excursions/child/overview/presentation/bloc/overview_bloc_factory.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_bloc_factory.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_bloc.dart';
import 'package:pole/feature/excursions/domain/navigate_to_excursion_step_use_case.dart';
import 'package:pole/feature/main/presentation/bloc/main_bloc.dart';

final class ExcursionsBlocFactory {
  final DateSelectionBlocFactory _dateSelectionBlocFactory;
  final PlanningBlocFactory _planningBlocFactory;
  final OverviewBlocFactory _overviewBlocFactory;
  final NavigateToExcursionStepUseCase _navigateToExcursionStepUseCase;

  ExcursionsBlocFactory({
    required DateSelectionBlocFactory dateSelectionBlocFactory,
    required PlanningBlocFactory planningBlocFactory,
    required OverviewBlocFactory overviewBlocFactory,
    required NavigateToExcursionStepUseCase navigateToExcursionStepUseCase,
  }) : _dateSelectionBlocFactory = dateSelectionBlocFactory,
    _planningBlocFactory = planningBlocFactory,
    _overviewBlocFactory = overviewBlocFactory,
    _navigateToExcursionStepUseCase = navigateToExcursionStepUseCase;

  ExcursionsBloc create({required MainBloc mainBloc}) => ExcursionsBloc(
    mainBloc: mainBloc,
    dateSelectionBlocFactory: _dateSelectionBlocFactory,
    planningBlocFactory: _planningBlocFactory,
    overviewBlocFactory: _overviewBlocFactory,
    navigateToExcursionStepUseCase: _navigateToExcursionStepUseCase,
  );
}
