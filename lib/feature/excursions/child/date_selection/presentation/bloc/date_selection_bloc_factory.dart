import 'package:pole/feature/excursions/child/date_selection/domain/load_cities_use_case.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_bloc.dart';
import 'package:pole/feature/excursions/data/repository/excursion_config_repository.dart';
import 'package:pole/feature/excursions/domain/use_case/listen_excursion_config_changes_use_case.dart';
import 'package:pole/navigation/app_router.dart';

final class DateSelectionBlocFactory {
  final AppRouter _router;
  final ListenExcursionConfigChangesUseCase _excursionConfigChangesUseCase;
  final LoadCitiesUseCase _loadCitiesUseCase;
  final ExcursionConfigRepository _excursionConfigRepository;

  DateSelectionBlocFactory({
    required AppRouter router,
    required ListenExcursionConfigChangesUseCase excursionConfigChangesUseCase,
    required LoadCitiesUseCase loadCitiesUseCase,
    required ExcursionConfigRepository excursionConfigRepository,
  }) : _router = router,
    _excursionConfigChangesUseCase = excursionConfigChangesUseCase,
    _loadCitiesUseCase = loadCitiesUseCase,
    _excursionConfigRepository = excursionConfigRepository;

  DateSelectionBloc create() => DateSelectionBloc(
    router: _router,
    excursionConfigChangesUseCase: _excursionConfigChangesUseCase,
    loadCitiesUseCase: _loadCitiesUseCase,
    excursionConfigRepository: _excursionConfigRepository,
  );
}
