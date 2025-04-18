import 'package:freezed_annotation/freezed_annotation.dart';

part 'excursions_step.freezed.dart';

@freezed
sealed class ExcursionsStep with _$ExcursionsStep {
  const factory ExcursionsStep.dateSelection() = DateSelection;

  const factory ExcursionsStep.planning() = Planning;

  const factory ExcursionsStep.overview() = Overview;

  const factory ExcursionsStep.creationFinish() = CreationFinish;
}
