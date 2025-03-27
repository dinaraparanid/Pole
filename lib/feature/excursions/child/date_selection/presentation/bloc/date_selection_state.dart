import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_selection_state.freezed.dart';

@freezed
abstract class DateSelectionState with _$DateSelectionState {
  const factory DateSelectionState({
    DateTime? selectedDate,
  }) = _DateSelectionState;
}

extension Properties on DateSelectionState {
  bool get isContinueButtonEnabled => selectedDate != null;
}
