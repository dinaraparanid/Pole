import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';

part 'place_selector_state.freezed.dart';

@freezed
abstract class PlaceSelectorState with _$PlaceSelectorState {
  const factory PlaceSelectorState({
    required DateTime startTime,
    required UiState<List<PlaceCategory>> availableCategories,
    required PagingState<int, VisitPlace> pagingState,
    @Default({}) Set<PlaceCategoryId> selectedCategories,
    double? visitDurationInput,
  }) = _PlaceSelectorState;
}
