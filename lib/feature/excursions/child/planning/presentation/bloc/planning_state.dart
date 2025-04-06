import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/text/text_container.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';

part 'planning_state.freezed.dart';

@freezed
abstract class PlanningState with _$PlanningState {
  const factory PlanningState({
    @Default(TextContainer(value: '', error: false))
    TextContainer<bool> excursionName,
    @Default([]) List<VisitPlace> selectedPlaces,
    @Default([]) List<PlaceCategory> selectedCategories,
    double? visitDurationInput,
  }) = _PlanningState;
}

extension Properties on PlanningState {
  bool get isContinueButtonEnabled => selectedPlaces.isNotEmpty;
}
