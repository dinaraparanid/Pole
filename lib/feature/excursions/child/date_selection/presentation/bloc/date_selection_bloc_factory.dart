import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_bloc.dart';
import 'package:pole/feature/excursions/data/repository/excursion_config_repository.dart';
import 'package:pole/feature/excursions/domain/use_case/listen_excursion_config_changes_use_case.dart';
import 'package:pole/navigation/app_router.dart';

final class DateSelectionBlocFactory {
  final AppRouter _router;
  final ListenExcursionConfigChangesUseCase _excursionConfigChangesUseCase;
  final ExcursionConfigRepository _excursionConfigRepository;

  DateSelectionBlocFactory({
    required AppRouter router,
    required ListenExcursionConfigChangesUseCase excursionConfigChangesUseCase,
    required ExcursionConfigRepository excursionConfigRepository,
  }) : _router = router,
    _excursionConfigChangesUseCase = excursionConfigChangesUseCase,
    _excursionConfigRepository = excursionConfigRepository;

  DateSelectionBloc create() => DateSelectionBloc(
    router: _router,
    excursionConfigChangesUseCase: _excursionConfigChangesUseCase,
    excursionConfigRepository: _excursionConfigRepository,
  );
}
