import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/mod.dart';

const _timetableHeight = 415.0;

final class ExcursionsTimetable extends StatelessWidget {
  const ExcursionsTimetable({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return BlocBuilder<PlanningBloc, PlanningState>(
      builder: (context, state) => Container(
        width: double.infinity,
        height: _timetableHeight,
        decoration: BoxDecoration(
          color: theme.colors.uniqueComponents.excursionTimetableBackground,
          borderRadius: BorderRadius.all(
            Radius.circular(theme.dimensions.radius.small),
          ),
          border: Border.all(
            color: theme.colors.uniqueComponents.excursionTimetableBorder,
            width: theme.dimensions.size.line.small,
          )
        ),
      ),
    );
  }
}
