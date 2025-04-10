import 'package:pole/core/domain/visit_place/entity/mod.dart';

sealed class PlanningEvent {}

final class ChangeExcursionName extends PlanningEvent {
  final String name;
  ChangeExcursionName({required this.name});
}

final class ShowPlaceSelector extends PlanningEvent {
  final DateTime startTime;
  ShowPlaceSelector({required this.startTime});
}

final class SelectPlace extends PlanningEvent {
  final VisitPlace place;
  SelectPlace({required this.place});
}

final class RemovePlace extends PlanningEvent {}

final class ConfirmDayPlan extends PlanningEvent {}
