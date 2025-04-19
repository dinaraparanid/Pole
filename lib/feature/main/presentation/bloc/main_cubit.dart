import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/main/presentation/bloc/main_state.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class MainCubit extends Cubit<MainState> {
  final AppRouter _router;

  MainCubit({required AppRouter router}) :
    _router = router, super(const MainState()) {

    _listenTabChanges();
  }

  StreamSubscription<MainTabs>? _tabsChangesListener;

  void selectTab(MainTabs tab) => emit(state.copyWith(selectedTab: tab));

  @override
  Future<void> close() {
    _tabsChangesListener?.cancel();
    return super.close();
  }

  void _listenTabChanges() {
    _tabsChangesListener = stream
      .map((s) => s.selectedTab)
      .distinct()
      .listen(_navigateToMainTab);
  }

  void _navigateToMainTab(MainTabs tab) {
    switch (tab) {
      case MainTabs.catalog:
        _router.value.goNamed(AppRoute.catalog.name);

      case MainTabs.excursions:
        _router.value.goNamed(AppRoute.excursions.name);

      case MainTabs.profile:
        _router.value.goNamed(AppRoute.profile.name);
    }
  }
}
