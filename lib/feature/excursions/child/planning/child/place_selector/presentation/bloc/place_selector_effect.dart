import 'package:pole/feature/excursions/child/planning/child/visit_duration/presentation/bloc/visit_duration_cubit.dart';

sealed class PlaceSelectorEffect {}

final class ShowVisitTimeDialog extends PlaceSelectorEffect {
  final VisitDurationCubit cubit;
  ShowVisitTimeDialog({required this.cubit});
}

final class HideVisitTimeDialog extends PlaceSelectorEffect {}
