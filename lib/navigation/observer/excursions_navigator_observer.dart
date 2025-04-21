import 'package:pole/feature/excursions/data/data_source/current_excursion_step_store.dart';
import 'package:pole/feature/excursions/domain/entity/excursions_step.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_route_data.dart';
import 'package:pole/navigation/observer/app_navigator_observer.dart';

final class ExcursionsNavigatorObserver extends AppNavigatorObserver {
  final CurrentExcursionStepStore _excursionStepStore;

  ExcursionsNavigatorObserver({
    required CurrentExcursionStepStore excursionStepStore
  }) : _excursionStepStore = excursionStepStore;

  @override
  Future<AppRouteData> get redirectRoute async => AppRouteData(
    name: switch (await _excursionStepStore.currentStep) {
      null || DateSelection() => AppRoute.dateSelection.name,
      Planning() => AppRoute.planning.name,
      Overview() => AppRoute.overview.name,
      CreationFinish() => AppRoute.creationFinish.name,
    }
  );

  void onExitCreationFinish() => backStack.clear();
}
