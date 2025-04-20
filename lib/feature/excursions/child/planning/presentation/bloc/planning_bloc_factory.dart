import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/place_selector_bloc_factory.dart';
import 'package:pole/feature/excursions/child/planning/domain/calculate_max_visit_duration_use_case.dart';
import 'package:pole/feature/excursions/child/planning/domain/load_categories_use_case.dart';
import 'package:pole/feature/excursions/child/planning/domain/store_selected_places_use_case.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_bloc.dart';
import 'package:pole/feature/excursions/data/repository/excursion_config_repository.dart';
import 'package:pole/feature/excursions/domain/use_case/listen_excursion_config_changes_use_case.dart';
import 'package:pole/navigation/app_router.dart';

final class PlanningBlocFactory {
  final AppRouter _router;
  final PlaceSelectorBlocFactory _placeSelectorBlocFactory;
  final TextChangeUseCase _textChangeUseCase;
  final CalculateMaxVisitDurationUseCase _calculateMaxVisitDurationUseCase;
  final LoadCategoriesUseCase _loadCategoriesUseCase;
  final ListenExcursionConfigChangesUseCase _excursionConfigChangesUseCase;
  final StoreSelectedPlacesUseCase _storeSelectedPlacesUseCase;
  final ExcursionConfigRepository _excursionConfigRepository;

  PlanningBlocFactory({
    required AppRouter router,
    required PlaceSelectorBlocFactory placeSelectorBlocFactory,
    required TextChangeUseCase textChangeUseCase,
    required CalculateMaxVisitDurationUseCase calculateMaxVisitDurationUseCase,
    required LoadCategoriesUseCase loadCategoriesUseCase,
    required ListenExcursionConfigChangesUseCase excursionConfigChangesUseCase,
    required StoreSelectedPlacesUseCase storeSelectedPlacesUseCase,
    required ExcursionConfigRepository excursionConfigRepository,
  }) : _router = router,
    _placeSelectorBlocFactory = placeSelectorBlocFactory,
    _textChangeUseCase = textChangeUseCase,
    _calculateMaxVisitDurationUseCase = calculateMaxVisitDurationUseCase,
    _loadCategoriesUseCase = loadCategoriesUseCase,
    _excursionConfigChangesUseCase = excursionConfigChangesUseCase,
    _storeSelectedPlacesUseCase = storeSelectedPlacesUseCase,
    _excursionConfigRepository = excursionConfigRepository;

  PlanningBloc create() => PlanningBloc(
    router: _router,
    placeSelectorBlocFactory: _placeSelectorBlocFactory,
    textChangeUseCase: _textChangeUseCase,
    calculateMaxVisitDurationUseCase: _calculateMaxVisitDurationUseCase,
    loadCategoriesUseCase: _loadCategoriesUseCase,
    excursionConfigChangesUseCase: _excursionConfigChangesUseCase,
    storeSelectedPlacesUseCase: _storeSelectedPlacesUseCase,
    excursionConfigRepository: _excursionConfigRepository,
  );
}
