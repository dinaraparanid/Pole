import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/main/presentation/bloc/main_event.dart';
import 'package:pole/feature/main/presentation/bloc/main_state.dart';

final class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<TabClicked>((event, emit) => emit(state.copyWith(selectedTab: event.tab)));
  }
}
