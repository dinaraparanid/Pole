import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_bloc.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_result.dart';

final class DateSelectionBlocFactory {
  DateSelectionBloc create({
    required void Function(DateSelectionResult) onResult,
  }) => DateSelectionBloc(onResult: onResult);
}
