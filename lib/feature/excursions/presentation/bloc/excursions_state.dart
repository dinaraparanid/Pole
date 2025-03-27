import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_step.dart';

part 'excursions_state.freezed.dart';

@freezed
abstract class ExcursionsState with _$ExcursionsState {
  static final dateSelectionProgress = 0.2;
  static final planningProgress = 0.6;
  static final overviewProgress = 1.0;

  const factory ExcursionsState({
    @Default(ExcursionsStep.dateSelection) ExcursionsStep step,
  }) = _ExcursionsState;
}

extension Properties on ExcursionsState {
  double get progress => switch (step) {
    ExcursionsStep.dateSelection => ExcursionsState.dateSelectionProgress,
    ExcursionsStep.planning => ExcursionsState.planningProgress,
    ExcursionsStep.overview => ExcursionsState.overviewProgress,
  };
}
