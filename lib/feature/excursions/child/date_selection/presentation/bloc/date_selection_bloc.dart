import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/feature/excursions/data/repository/excursion_config_repository.dart';
import 'package:pole/feature/excursions/domain/use_case/listen_excursion_config_changes_use_case.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_event.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_state.dart';
import 'package:pole/navigation/mod.dart';

final class DateSelectionBloc extends Bloc<DateSelectionEvent, DateSelectionState> {
  StreamSubscription<void>? _excursionConfigChangesListener;

  DateSelectionBloc({
    required AppRouter router,
    required ListenExcursionConfigChangesUseCase excursionConfigChangesUseCase,
    required ExcursionConfigRepository excursionConfigRepository,
  }) : super(DateSelectionState()) {
    on<UpdateState>((event, emit) => emit(state.copyWith(
      selectedCity: event.city ?? state.selectedCity,
      selectedDate: event.date ?? state.selectedDate,
    )));

    on<SelectDate>((event, emit) async =>
      await excursionConfigRepository.selectDate(event.date),
    );

    on<ContinueClick>((event, emit) =>
      router.value.goNamed(AppRoute.planning.name),
    );

    _excursionConfigChangesListener = excursionConfigChangesUseCase(
      update: (city, date, _, _) => add(UpdateState(city: city, date: date)),
    );

    // TODO: remove stub
    excursionConfigRepository.selectCity(City(id: 0, name: 'г. Иннополис'));
  }

  @override
  Future<void> close() async {
    await _excursionConfigChangesListener?.cancel();
    return super.close();
  }
}
