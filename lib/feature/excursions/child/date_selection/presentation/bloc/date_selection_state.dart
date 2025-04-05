import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/city/entity/city.dart';

part 'date_selection_state.freezed.dart';

@freezed
abstract class DateSelectionState with _$DateSelectionState {
  const factory DateSelectionState({
    @Default(City(id: 0, name: 'г. Иннополис')) City? selectedCity,
    DateTime? selectedDate,
  }) = _DateSelectionState;
}

extension Properties on DateSelectionState {
  bool get isContinueButtonEnabled => selectedDate != null;
}
