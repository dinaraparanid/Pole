import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/excursions/presentation/bloc/mod.dart';
import 'package:pole/feature/main/domain/navigate_to_main_tab_use_case.dart';
import 'package:pole/feature/main/presentation/bloc/main_event.dart';
import 'package:pole/feature/main/presentation/bloc/main_state.dart';

final class MainBloc extends Bloc<MainEvent, MainState> {
  final NavigateToMainTabUseCase _navigateToMainTabUseCase;
  final ExcursionsBlocFactory _excursionsBlocFactory;

  MainBloc({
    required ExcursionsBlocFactory excursionsBlocFactory,
    required NavigateToMainTabUseCase navigateToMainTabUseCase,
  }) : _excursionsBlocFactory = excursionsBlocFactory,
    _navigateToMainTabUseCase = navigateToMainTabUseCase,
    super(const MainState()) {

    on<TabClicked>((event, emit) =>
      emit(state.copyWith(selectedTab: event.tab))
    );

    add(TabClicked(tab: MainTabs.excursions)); // required to trigger tab stream
    stream.map((s) => s.selectedTab).distinct().listen(_navigateToMainTab);
  }

  void _navigateToMainTab(MainTabs tab) {
    _navigateToMainTabUseCase.execute(
      tab: tab,
      mainBloc: this,
      excursionsBlocFactory: _createExcursionsBloc,
    );
  }

  ExcursionsBloc _createExcursionsBloc() => _excursionsBlocFactory.create();
}
