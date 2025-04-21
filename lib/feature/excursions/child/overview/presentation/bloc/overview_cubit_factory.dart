import 'package:pole/feature/excursions/child/overview/domain/create_excursion_use_case.dart';
import 'package:pole/feature/excursions/child/overview/presentation/bloc/overview_cubit.dart';
import 'package:pole/feature/excursions/domain/use_case/listen_excursion_config_changes_use_case.dart';
import 'package:pole/navigation/app_router.dart';

final class OverviewCubitFactory {
  final AppRouter _router;
  final ListenExcursionConfigChangesUseCase _excursionConfigChangesUseCase;
  final CreateExcursionUseCase _createExcursionUseCase;

  OverviewCubitFactory({
    required AppRouter router,
    required ListenExcursionConfigChangesUseCase excursionConfigChangesUseCase,
    required CreateExcursionUseCase createExcursionUseCase,
  }) : _router = router,
    _excursionConfigChangesUseCase = excursionConfigChangesUseCase,
    _createExcursionUseCase = createExcursionUseCase;

  OverviewCubit create() => OverviewCubit(
    router: _router,
    excursionConfigChangesUseCase: _excursionConfigChangesUseCase,
    createExcursionUseCase: _createExcursionUseCase,
  );
}
