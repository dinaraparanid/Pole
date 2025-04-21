import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/excursions/child/overview/domain/create_excursion_use_case.dart';
import 'package:pole/feature/excursions/child/overview/presentation/bloc/overview_cubit_factory.dart';

extension OverviewModule on GetIt {
  List<Type> registerOverviewModule() => [
    provideSingleton(() => CreateExcursionUseCase(excursionRepository: this())),

    provideSingleton(() => OverviewCubitFactory(
      router: this(),
      excursionConfigChangesUseCase: this(),
      createExcursionUseCase: this(),
    )),
  ];
}
