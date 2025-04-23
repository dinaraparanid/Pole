import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/excursion/entity/excursion.dart';
import 'package:pole/core/domain/text/text_container.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';

part 'tours_state.freezed.dart';

@freezed
abstract class ToursState with _$ToursState {
  const factory ToursState({
    @Default(TextContainer(value: '', error: null))
    TextContainer<void> searchQuery,

    @Default(UiState.initial())
    UiState<IList<Excursion>> excursionListState,
  }) = _ToursState;
}
