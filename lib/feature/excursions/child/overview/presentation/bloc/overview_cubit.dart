import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/excursion/entity/excursion.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/feature/excursions/child/overview/domain/create_excursion_use_case.dart';
import 'package:pole/feature/excursions/child/overview/presentation/bloc/overview_effect.dart';
import 'package:pole/feature/excursions/child/overview/presentation/bloc/overview_state.dart';
import 'package:pole/feature/excursions/domain/use_case/listen_excursion_config_changes_use_case.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class OverviewCubit extends Cubit<OverviewState>
  with BlocPresentationMixin<OverviewState, OverviewEffect> {
  final AppRouter _router;
  final CreateExcursionUseCase _createExcursionUseCase;

  OverviewCubit({
    required AppRouter router,
    required ListenExcursionConfigChangesUseCase excursionConfigChangesUseCase,
    required CreateExcursionUseCase createExcursionUseCase,
  }) : _router = router,
    _createExcursionUseCase = createExcursionUseCase,
    super(OverviewState()) {

    excursionConfigChangesUseCase(update: (city, _, name, selectedPlaces) {
      if (city != null) {
        emit(state.copyWith(excursionState: UiState.data(
          value: Excursion(
            city: city,
            name: name,
            visitations: selectedPlaces,
            images: const IList.empty(), // TODO
          ),
        )));
      }
    });
  }

  void createExcursion() => _createExcursionUseCase(
    excursion: state.excursion,
    onSuccess: () => _router.value.goNamed(AppRoute.creationFinish.name),
    onFailure: (_) => emitPresentation(ShowFailedToCreateExcursionEffect()),
  );
}
