import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_event.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_state.dart';

final class DateSelectionBloc extends Bloc<DateSelectionEvent, DateSelectionState> {
  final void Function() _onResult;

  DateSelectionBloc({
    required void Function() onResult,
  }) : _onResult = onResult,
    super(DateSelectionState()) {

    on<DatePickerClick>((event, emit) {});

    on<ContinueClick>((event, emit) {});
  }
}
