import 'package:pole/feature/excursions/data/data_source/current_excursion_step_store.dart';
import 'package:pole/feature/excursions/data/excursion_store_cleaner.dart';
import 'package:pole/feature/excursions/domain/entity/excursions_step.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_route_data.dart';
import 'package:pole/navigation/observer/app_navigator_observer.dart';

final class ExcursionsNavigatorObserver extends AppNavigatorObserver {
  final CurrentExcursionStepStore _excursionStepStore;
  final ExcursionStoreCleaner _excursionStoreCleaner;

  ExcursionsNavigatorObserver({
    required CurrentExcursionStepStore excursionStepStore,
    required ExcursionStoreCleaner excursionStoreCleaner,
  }) : _excursionStepStore = excursionStepStore,
    _excursionStoreCleaner = excursionStoreCleaner;

  @override
  Future<AppRouteData> get redirectRoute async => AppRouteData(
    name: switch (await _excursionStepStore.currentStep) {
      null || DateSelection() => AppRoute.dateSelection.name,
      Planning() => AppRoute.planning.name,
      Overview() => AppRoute.overview.name,
      CreationFinish() => AppRoute.creationFinish.name,
    }
  );

  Future<void> onExitCreationFinish() async {
    backStack.clear();
    await _excursionStoreCleaner();
  }
}
