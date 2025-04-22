import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/excursions/child/creation_finish/di/creation_finish_module.dart';
import 'package:pole/feature/excursions/child/date_selection/di/date_selection_module.dart';
import 'package:pole/feature/excursions/child/overview/di/overview_module.dart';
import 'package:pole/feature/excursions/child/planning/di/planning_module.dart';
import 'package:pole/feature/excursions/data/data_source/current_excursion_step_store.dart';
import 'package:pole/feature/excursions/data/data_source/excursion_name_store.dart';
import 'package:pole/feature/excursions/data/data_source/selected_city_store.dart';
import 'package:pole/feature/excursions/data/data_source/selected_date_store.dart';
import 'package:pole/feature/excursions/data/data_source/selected_places_store.dart';
import 'package:pole/feature/excursions/data/excursion_store_cleaner.dart';
import 'package:pole/feature/excursions/data/repository/excursion_config_repository.dart';
import 'package:pole/feature/excursions/domain/use_case/listen_excursion_config_changes_use_case.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_cubit_factory.dart';

extension ExcursionsModule on GetIt {
  List<Type> registerExcursionsModule() => [
    ...registerDateSelectionModule(),
    ...registerPlanningModule(),
    ...registerOverviewModule(),
    ...registerCreationFinishModule(),

    provideSingleton(() => SelectedCityStore()),
    provideSingleton(() => SelectedDateStore()),
    provideSingleton(() => ExcursionNameStore()),
    provideSingleton(() => SelectedPlacesStore()),
    provideSingleton(() => CurrentExcursionStepStore()),

    provideSingleton(() => ExcursionStoreCleaner(
      currentExcursionStepStore: this(),
      excursionNameStore: this(),
      selectedCityStore: this(),
      selectedDateStore: this(),
      selectedPlacesStore: this()
    )),

    provideSingleton(() => ExcursionConfigRepository(
      cityStore: this(),
      dateStore: this(),
      excursionNameStore: this(),
      selectedPlacesStore: this(),
    )),

    provideSingleton(() => ListenExcursionConfigChangesUseCase(
      excursionConfigRepository: this(),
    )),

    provideSingleton(() => ExcursionsCubitFactory(
      excursionStepStore: this(),
    )),
  ];
}
