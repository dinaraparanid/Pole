import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_step.dart';

part 'excursions_state.freezed.dart';

@freezed
abstract class ExcursionsState with _$ExcursionsState {
  static final dateSelectionProgress = 0.2;
  static final planningProgress = 0.6;
  static final overviewProgress = 1.0;

  const factory ExcursionsState({
    @Default(DateSelection()) ExcursionsStep step,
  }) = _ExcursionsState;
}

extension Properties on ExcursionsState {
  double get progress => switch (step) {
    DateSelection() => ExcursionsState.dateSelectionProgress,
    Planning() => ExcursionsState.planningProgress,
    Overview() => ExcursionsState.overviewProgress,
  };
}
