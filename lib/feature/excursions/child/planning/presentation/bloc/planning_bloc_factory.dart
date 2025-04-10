import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/place_selector_bloc_factory.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_bloc.dart';

final class PlanningBlocFactory {
  final TextChangeUseCase _textChangeUseCase;
  final PlaceSelectorBlocFactory _placeSelectorBlocFactory;

  PlanningBlocFactory({
    required TextChangeUseCase textChangeUseCase,
    required PlaceSelectorBlocFactory placeSelectorBlocFactory,
  }) : _textChangeUseCase = textChangeUseCase,
    _placeSelectorBlocFactory = placeSelectorBlocFactory;

  PlanningBloc create({
    required City city,
    required DateTime date,
    required void Function() onResult,
  }) => PlanningBloc(
    textChangeUseCase: _textChangeUseCase,
    placeSelectorBlocFactory: _placeSelectorBlocFactory,
    city: city,
    date: date,
    onResult: onResult,
  );
}
