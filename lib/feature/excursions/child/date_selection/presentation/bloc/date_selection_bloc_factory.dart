import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_bloc.dart';
import 'package:pole/navigation/app_router.dart';

final class DateSelectionBlocFactory {
  final AppRouter _router;

  DateSelectionBlocFactory({required AppRouter router}) : _router = router;

  DateSelectionBloc create() => DateSelectionBloc(router: _router);
}
