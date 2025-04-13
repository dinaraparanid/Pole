import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/core/domain/excursion/excursion.dart';

part 'excursions_step.freezed.dart';

@freezed
sealed class ExcursionsStep with _$ExcursionsStep {
  const factory ExcursionsStep.dateSelection() = DateSelection;

  const factory ExcursionsStep.planning({
    required City city,
    required DateTime date,
  }) = Planning;

  const factory ExcursionsStep.overview({
    required Excursion excursion,
  }) = Overview;
}
