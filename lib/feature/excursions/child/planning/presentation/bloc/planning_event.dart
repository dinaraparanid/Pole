import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pole/core/domain/excursion/excursion_name.dart';
import 'package:pole/core/domain/visit_place/entity/place_category.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/feature/excursions/child/planning/domain/visitation.dart';

sealed class PlanningEvent {}

final class UpdateState extends PlanningEvent {
  final DateTime? date;
  final ExcursionName? name;
  final IList<Visitation>? selectedPlaces;

  UpdateState({
    this.date,
    this.name,
    this.selectedPlaces,
  });
}

final class UpdateCategories extends PlanningEvent {
  final UiState<IList<PlaceCategory>> categoriesState;
  UpdateCategories({required this.categoriesState});
}

final class OnCreate extends PlanningEvent {
  final String initialName;
  OnCreate({required this.initialName});
}

final class ChangeExcursionName extends PlanningEvent {
  final String name;
  ChangeExcursionName({required this.name});
}

final class ShowPlaceSelector extends PlanningEvent {
  final DateTime startTime;
  ShowPlaceSelector({required this.startTime});
}

final class SelectPlace extends PlanningEvent {
  final Visitation visitation;
  SelectPlace({required this.visitation});
}

final class RemovePlace extends PlanningEvent {
  final Visitation visitation;
  RemovePlace({required this.visitation});
}

final class ConfirmDayPlan extends PlanningEvent {}
