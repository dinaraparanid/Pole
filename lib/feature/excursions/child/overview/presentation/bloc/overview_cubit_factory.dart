import 'package:pole/core/domain/excursion/excursion.dart';
import 'package:pole/feature/excursions/child/overview/presentation/bloc/overview_cubit.dart';
import 'package:pole/navigation/app_router.dart';

final class OverviewCubitFactory {
  final AppRouter _router;

  OverviewCubitFactory({required AppRouter router}) : _router = router;

  OverviewCubit create({required Excursion excursion}) =>
    OverviewCubit(router: _router, excursion: excursion);
}
