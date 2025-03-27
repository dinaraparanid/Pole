import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_bloc.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_bloc.dart';

final class ExcursionsExtra {
  final ExcursionsBloc excursionsBloc;
  final DateSelectionBloc? dateSelectionBloc;

  ExcursionsExtra({
    required this.excursionsBloc,
    this.dateSelectionBloc,
  });
}
