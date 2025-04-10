import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';

part 'place_selector_state.freezed.dart';

@freezed
abstract class PlaceSelectorState with _$PlaceSelectorState {
  const factory PlaceSelectorState({
    required DateTime startTime,
    required UiState<List<PlaceCategory>> availableCategories,
    @Default([]) List<PlaceCategory> selectedCategories,
    double? visitDurationInput,
  }) = _PlaceSelectorState;
}
