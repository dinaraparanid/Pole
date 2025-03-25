import 'package:pole/feature/excursions/presentation/bloc/excursions_bloc.dart';
import 'package:pole/feature/main/presentation/bloc/main_bloc.dart';
import 'package:pole/feature/main/presentation/bloc/main_state.dart';
import 'package:pole/feature/main/routing/main_extra.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class NavigateToMainTabUseCase {
  final AppRouter _router;

  NavigateToMainTabUseCase({
    required AppRouter router,
  }) : _router = router;

  void execute({
    required MainTabs tab,
    required MainBloc mainBloc,
    required ExcursionsBloc Function() excursionsBlocFactory,
  }) {
    switch (tab) {
      case MainTabs.catalog:
        _router.value.replaceNamed(
          AppRoute.catalog.name,
          extra: MainExtra(mainBloc: mainBloc),
        );

      case MainTabs.excursions:
        _router.value.replaceNamed(
          AppRoute.excursions.name,
          extra: MainExtra(
            mainBloc: mainBloc,
            excursionsBloc: excursionsBlocFactory(),
          ),
        );

      case MainTabs.profile:
        _router.value.replaceNamed(
          AppRoute.profile.name,
          extra: MainExtra(mainBloc: mainBloc),
        );
    }
  }
}
