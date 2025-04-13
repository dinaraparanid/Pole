import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/excursion/excursion.dart';

part 'overview_state.freezed.dart';

@freezed
abstract class OverviewState with _$OverviewState {
  const factory OverviewState({
    required Excursion excursion,
  }) = _OverviewState;
}
