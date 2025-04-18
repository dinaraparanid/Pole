import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/place_selector_bloc_factory.dart';
import 'package:pole/feature/excursions/child/planning/domain/calculate_max_visit_duration_use_case.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_bloc.dart';
import 'package:pole/navigation/app_router.dart';

final class PlanningBlocFactory {
  final AppRouter _router;
  final PlaceSelectorBlocFactory _placeSelectorBlocFactory;
  final TextChangeUseCase _textChangeUseCase;
  final CalculateMaxVisitDurationUseCase _calculateMaxVisitDurationUseCase;

  PlanningBlocFactory({
    required AppRouter router,
    required PlaceSelectorBlocFactory placeSelectorBlocFactory,
    required TextChangeUseCase textChangeUseCase,
    required CalculateMaxVisitDurationUseCase calculateMaxVisitDurationUseCase,
  }) : _router = router,
    _placeSelectorBlocFactory = placeSelectorBlocFactory,
    _textChangeUseCase = textChangeUseCase,
    _calculateMaxVisitDurationUseCase = calculateMaxVisitDurationUseCase;

  PlanningBloc create({
    required City city,
    required DateTime date,
  }) => PlanningBloc(
    router: _router,
    placeSelectorBlocFactory: _placeSelectorBlocFactory,
    textChangeUseCase: _textChangeUseCase,
    calculateMaxVisitDurationUseCase: _calculateMaxVisitDurationUseCase,
    city: city,
    date: date,
  );
}
