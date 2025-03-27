import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/date_selection_bloc.dart';

final class DateSelectionBlocFactory {
  DateSelectionBloc create({
    required void Function() onResult,
  }) => DateSelectionBloc(onResult: onResult);
}
