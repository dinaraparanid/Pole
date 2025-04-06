import 'package:pole/core/domain/visit_place/entity/mod.dart';

sealed class PlanningEvent {}

final class ChangeExcursionName extends PlanningEvent {
  final String name;
  ChangeExcursionName({required this.name});
}

final class ShowPlaceSelector extends PlanningEvent {
  final DateTime startDate;
  ShowPlaceSelector({required this.startDate});
}

final class ChangePlaceCategorySelection extends PlanningEvent {
  final PlaceCategory category;
  ChangePlaceCategorySelection({required this.category});
}

final class SelectPlace extends PlanningEvent {
  final VisitPlace place;
  SelectPlace({required this.place});
}

final class SetVisitDuration extends PlanningEvent {}

final class ConfirmPlace extends PlanningEvent {}

final class RemovePlace extends PlanningEvent {}

final class ConfirmDayPlan extends PlanningEvent {}
