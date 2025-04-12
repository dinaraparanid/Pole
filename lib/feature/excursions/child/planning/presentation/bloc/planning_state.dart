import 'package:dartx/dartx.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/text/text_container.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/feature/excursions/child/planning/domain/visitation.dart';
import 'package:pole/feature/excursions/child/planning/presentation/widget/timetable/timetable_config.dart';

part 'planning_state.freezed.dart';

@freezed
abstract class PlanningState with _$PlanningState {
  const factory PlanningState({
    required DateTime date,
    @Default(TextContainer(value: '', error: false))
    TextContainer<bool> excursionName,
    @Default(UiState.initial()) UiState<IList<PlaceCategory>> allCategories,
    @Default(IList.empty()) IList<Visitation> selectedPlaces,
  }) = _PlanningState;
}

extension Properties on PlanningState {
  bool get isContinueButtonEnabled => selectedPlaces.isNotEmpty;

  Visitation? visitationAt({required DateTime time}) =>
    selectedPlaces.firstOrNullWhere((visitation) =>
      time >= visitation.startTime && time < visitation.endTime,
    );

  IList<Visitation?> produceTimetable() => IList(
    IntRange(
      TimetableConfig.firstHour,
      TimetableConfig.firstHour + TimetableConfig.availableHoursPerDay - 1,
    )
      .map((h) => visitationAt(time: date.copyWith(hour: h)))
      .chunkWhile((x, y) => x != null && y != null && x == y)
      .map((x) => x.first),
  );
}
