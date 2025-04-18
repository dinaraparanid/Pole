import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_event.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_state.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class DateSelectionBloc extends Bloc<DateSelectionEvent, DateSelectionState> {
  final AppRouter _router;

  DateSelectionBloc({required AppRouter router}) :
    _router = router,
    super(DateSelectionState()) {

    on<SelectDate>((event, emit) =>
      emit(state.copyWith(selectedDate: event.date)),
    );

    on<ContinueClick>((event, emit) => _router.value.goNamed(
      AppRoute.planning.name,
      extra: (state.selectedCity!, state.selectedDate!),
    ));
  }
}
