import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/excursion/excursion.dart';
import 'package:pole/feature/excursions/child/overview/presentation/bloc/overview_state.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class OverviewCubit extends Cubit<OverviewState> {
  final AppRouter _router;

  OverviewCubit({
    required AppRouter router,
    required Excursion excursion,
  }) : _router = router, super(OverviewState(excursion: excursion));

  void createExcursion() =>
    _router.value.goNamed(AppRoute.creationFinish.name);
}
