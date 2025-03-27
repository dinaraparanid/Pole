import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_bloc_factory.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_bloc.dart';
import 'package:pole/feature/excursions/presentation/domain/navigate_to_excursion_step_use_case.dart';
import 'package:pole/feature/main/presentation/bloc/main_bloc.dart';

final class ExcursionsBlocFactory {
  final DateSelectionBlocFactory _dateSelectionBlocFactory;
  final NavigateToExcursionStepUseCase _navigateToExcursionStepUseCase;

  ExcursionsBlocFactory({
    required DateSelectionBlocFactory dateSelectionBlocFactory,
    required NavigateToExcursionStepUseCase navigateToExcursionStepUseCase,
  }) : _dateSelectionBlocFactory = dateSelectionBlocFactory,
    _navigateToExcursionStepUseCase = navigateToExcursionStepUseCase;

  ExcursionsBloc create({required MainBloc mainBloc}) => ExcursionsBloc(
    mainBloc: mainBloc,
    dateSelectionBlocFactory: _dateSelectionBlocFactory,
    navigateToExcursionStepUseCase: _navigateToExcursionStepUseCase,
  );
}
