import 'package:pole/feature/excursions/child/creation_finish/presentation/bloc/creation_finish_cubit_factory.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_bloc_factory.dart';
import 'package:pole/feature/excursions/child/overview/presentation/bloc/overview_cubit_factory.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_bloc_factory.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_cubit.dart';

final class ExcursionsCubitFactory {
  ExcursionsCubitFactory({
    required DateSelectionBlocFactory dateSelectionBlocFactory,
    required PlanningBlocFactory planningBlocFactory,
    required OverviewCubitFactory overviewBlocFactory,
    required CreationFinishCubitFactory creationFinishCubitFactory,
  });

  ExcursionsCubit call() => ExcursionsCubit();
}
