import 'package:dartx/dartx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/text/text_container.dart';
import 'package:pole/core/domain/visit_place/entity/visit_place.dart';
import 'package:pole/feature/excursions/child/planning/child/visit_duration/presentation/bloc/visit_duration_input_error.dart';

part 'visit_duration_state.freezed.dart';

@freezed
abstract class VisitDurationState with _$VisitDurationState {
  const factory VisitDurationState({
    required VisitPlace place,
    required Duration maxDuration,
    @Default(TextContainer(value: '', error: null))
    TextContainer<VisitDurationInputError?> input,
  }) = _VisitDurationState;
}

extension Properties on VisitDurationState {
  bool get isConfirmButtonEnabled =>
    input.value.isNotBlank && input.error == null;
}
