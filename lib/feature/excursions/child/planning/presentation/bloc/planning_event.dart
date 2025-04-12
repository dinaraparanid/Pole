import 'package:pole/feature/excursions/child/planning/domain/visitation.dart';

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
  final Visitation visitation;
  SelectPlace({required this.visitation});
}

final class RemovePlace extends PlanningEvent {
  final Visitation visitation;
  RemovePlace({required this.visitation});
}

final class ConfirmDayPlan extends PlanningEvent {}
