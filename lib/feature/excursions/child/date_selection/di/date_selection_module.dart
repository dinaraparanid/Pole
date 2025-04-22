import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/excursions/child/date_selection/domain/load_cities_use_case.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_bloc_factory.dart';

extension DateSelectionModule on GetIt {
  List<Type> registerDateSelectionModule() => [
    provideSingleton(() => LoadCitiesUseCase(repository: this())),

    provideSingleton(() => DateSelectionBlocFactory(
      router: this(),
      excursionConfigChangesUseCase: this(),
      loadCitiesUseCase: this(),
      excursionConfigRepository: this(),
    )),
  ];
}
