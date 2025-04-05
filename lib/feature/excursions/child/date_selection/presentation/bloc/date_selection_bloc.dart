import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_event.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_result.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_state.dart';

final class DateSelectionBloc extends Bloc<DateSelectionEvent, DateSelectionState> {
  DateSelectionBloc({
    required void Function(DateSelectionResult) onResult,
  }) : super(DateSelectionState()) {

    on<SelectDate>((event, emit) =>
        emit(state.copyWith(selectedDate: event.date)),
    );

    on<ContinueClick>((event, emit) => onResult(
      DateSelectionResult(
        selectedCity: state.selectedCity!,
        selectedDate: state.selectedDate!,
      ),
    ));
  }
}
