import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/excursions/presentation/bloc/mod.dart';
import 'package:pole/feature/main/presentation/bloc/main_event.dart';
import 'package:pole/feature/main/presentation/bloc/main_state.dart';

final class MainBloc extends Bloc<MainEvent, MainState> {
  final ExcursionsBlocFactory _excursionsBlocFactory;

  MainBloc({
    required ExcursionsBlocFactory excursionsBlocFactory,
  }) : _excursionsBlocFactory = excursionsBlocFactory,
    super(const MainState()) {
    on<TabClicked>((event, emit) => emit(state.copyWith(selectedTab: event.tab)));
  }

  ExcursionsBloc createExcursionsBloc() => _excursionsBlocFactory.create();
}
