import 'package:dartx/dartx.dart';
import 'package:pole/core/utils/ext/general.dart';
import 'package:pole/feature/excursions/child/planning/domain/visitation.dart';
import 'package:pole/feature/excursions/child/planning/presentation/widget/timetable/timetable_config.dart';

final class CalculateMaxVisitDurationUseCase {
  Duration call({
    required Iterable<Visitation> selectedPlaces,
    required DateTime startTime,
  }) => selectedPlaces
    .firstOrNullWhere((visitation) => visitation.startTime > startTime)
    ?.let((visitation) => Duration(hours: visitation.startTime.hour - startTime.hour))
    ?? Duration(hours: TimetableConfig.lastHour - startTime.hour);
}
