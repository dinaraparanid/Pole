import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/excursion/entity/excursion.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/core/domain/excursion/entity/excursion_info.dart';

part 'overview_state.freezed.dart';

@freezed
abstract class OverviewState with _$OverviewState {
  const factory OverviewState({
    @Default(UiState.initial()) UiState<ExcursionInfo> excursionState,
  }) = _OverviewState;
}

extension Properties on OverviewState {
  ExcursionInfo get excursion => excursionState.getOrNull!;
}
