import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_bloc.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_bloc.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_step.dart';
import 'package:pole/feature/excursions/rooting/excursions_extra.dart';
import 'package:pole/feature/main/presentation/bloc/main_bloc.dart';
import 'package:pole/feature/main/routing/main_extra.dart';
import 'package:pole/navigation/mod.dart';

final class NavigateToExcursionStepUseCase {
  final AppRouter _router;
  NavigateToExcursionStepUseCase({required AppRouter router}) : _router = router;

  void execute({
    required ExcursionsStep step,
    required MainBloc mainBloc,
    required ExcursionsBloc excursionsBloc,
    required DateSelectionBloc Function() dateSelectionBlocFactory,
  }) {
    switch (step) {
      case ExcursionsStep.dateSelection:
        _router.value.replaceNamed(
          AppRoute.dateSelection.name,
          extra: MainExtra(
            mainBloc: mainBloc,
            excursionsExtra: ExcursionsExtra(
              excursionsBloc: excursionsBloc,
              dateSelectionBloc: dateSelectionBlocFactory(),
            ),
          ),
        );

      case ExcursionsStep.planning:
        _router.value.replaceNamed(
          AppRoute.planning.name,
          extra: MainExtra(
            mainBloc: mainBloc,
            excursionsExtra: ExcursionsExtra(
              excursionsBloc: excursionsBloc,
            ),
          ),
        );

      case ExcursionsStep.overview:
        _router.value.replaceNamed(
          AppRoute.overview.name,
          extra: MainExtra(
            mainBloc: mainBloc,
            excursionsExtra: ExcursionsExtra(
              excursionsBloc: excursionsBloc,
            ),
          ),
        );
    }
  }
}
