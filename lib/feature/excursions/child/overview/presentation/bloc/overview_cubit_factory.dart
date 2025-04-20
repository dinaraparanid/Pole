import 'package:pole/feature/excursions/child/overview/presentation/bloc/overview_cubit.dart';
import 'package:pole/feature/excursions/domain/use_case/listen_excursion_config_changes_use_case.dart';
import 'package:pole/navigation/app_router.dart';

final class OverviewCubitFactory {
  final AppRouter _router;
  final ListenExcursionConfigChangesUseCase _excursionConfigChangesUseCase;

  OverviewCubitFactory({
    required AppRouter router,
    required ListenExcursionConfigChangesUseCase excursionConfigChangesUseCase,
  }) : _router = router,
    _excursionConfigChangesUseCase = excursionConfigChangesUseCase;

  OverviewCubit create() => OverviewCubit(
    router: _router,
    excursionConfigChangesUseCase: _excursionConfigChangesUseCase,
  );
}
