import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_bloc.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_bloc_factory.dart';
import 'package:pole/feature/excursions/rooting/excursions_extra.dart';
import 'package:pole/feature/main/domain/navigate_to_main_tab_use_case.dart';
import 'package:pole/feature/main/presentation/bloc/main_event.dart';
import 'package:pole/feature/main/presentation/bloc/main_state.dart';

final class MainBloc extends Bloc<MainEvent, MainState> {
  final NavigateToMainTabUseCase _navigateToMainTabUseCase;
  final ExcursionsBlocFactory _excursionsBlocFactory;

  late final ExcursionsBloc _excursionsBloc =
    _excursionsBlocFactory.create(mainBloc: this);

  StreamSubscription<MainTabs>? _tabsChangesListener;

  MainBloc({
    required ExcursionsBlocFactory excursionsBlocFactory,
    required NavigateToMainTabUseCase navigateToMainTabUseCase,
  }) : _excursionsBlocFactory = excursionsBlocFactory,
    _navigateToMainTabUseCase = navigateToMainTabUseCase,
    super(const MainState()) {

    on<TabClicked>((event, emit) => emit(state.copyWith(selectedTab: event.tab)));
    on<OnResume>((event, emit) => add(TabClicked(tab: state.selectedTab)));

    _listenTabChanges();
  }

  @override
  Future<void> close() {
    _tabsChangesListener?.cancel();
    return super.close();
  }

  void _listenTabChanges() {
    add(TabClicked(tab: MainTabs.excursions));
    _tabsChangesListener = stream
      .map((s) => s.selectedTab)
      .distinct()
      .listen(_navigateToMainTab);
  }

  void _navigateToMainTab(MainTabs tab) => _navigateToMainTabUseCase.execute(
    tab: tab,
    mainBloc: this,
    excursionsExtraFactory: () => ExcursionsExtra(
      excursionsBloc: _excursionsBloc,
    ),
  );
}
