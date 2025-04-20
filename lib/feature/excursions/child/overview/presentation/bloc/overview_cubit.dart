import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/excursion/excursion.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/feature/excursions/child/overview/presentation/bloc/overview_state.dart';
import 'package:pole/feature/excursions/domain/use_case/listen_excursion_config_changes_use_case.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class OverviewCubit extends Cubit<OverviewState> {
  final AppRouter _router;

  OverviewCubit({
    required AppRouter router,
    required ListenExcursionConfigChangesUseCase excursionConfigChangesUseCase,
  }) : _router = router, super(OverviewState()) {

    excursionConfigChangesUseCase(update: (city, _, name, selectedPlaces) {
      if (city != null) {
        emit(state.copyWith(excursionState: UiState.data(
          value: Excursion(city: city, name: name, visitations: selectedPlaces),
        )));
      }
    });
  }

  void createExcursion() => _router.value.goNamed(AppRoute.creationFinish.name);
}
