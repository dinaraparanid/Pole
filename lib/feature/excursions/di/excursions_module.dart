import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/excursions/child/creation_finish/di/creation_finish_module.dart';
import 'package:pole/feature/excursions/child/date_selection/di/date_selection_module.dart';
import 'package:pole/feature/excursions/child/overview/di/overview_module.dart';
import 'package:pole/feature/excursions/child/planning/di/planning_module.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_cubit_factory.dart';

extension ExcursionsModule on GetIt {
  List<Type> registerExcursionsModule() => [
    ...registerDateSelectionModule(),
    ...registerPlanningModule(),
    ...registerOverviewModule(),
    ...registerCreationFinishModule(),
    provideSingleton<ExcursionsCubitFactory>(() => ExcursionsCubitFactory(
      dateSelectionBlocFactory: this(),
      planningBlocFactory: this(),
      overviewBlocFactory: this(),
      creationFinishCubitFactory: this(),
    )),
  ];
}
