import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_step.dart';

part 'excursions_state.freezed.dart';

@freezed
abstract class ExcursionsState with _$ExcursionsState {
  const factory ExcursionsState({
    @Default(ExcursionsStep.dateSelection) ExcursionsStep step,
  }) = _ExcursionsState;
}

extension Properties on ExcursionsState {
  double get progress => switch (step) {
    ExcursionsStep.dateSelection => 0.2,
    ExcursionsStep.planning => 0.6,
    ExcursionsStep.overview => 1.0,
  };
}
