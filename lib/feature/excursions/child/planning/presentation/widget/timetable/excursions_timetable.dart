import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/planning/presentation/widget/timetable/timetable_config.dart';
import 'package:pole/feature/excursions/child/planning/presentation/widget/timetable/timetable_item.dart';

final class ExcursionsTimetable extends StatelessWidget {
  final void Function(PlanningEvent) onEvent;
  const ExcursionsTimetable({super.key, required this.onEvent});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    final borderRadius = BorderRadius.circular(theme.dimensions.radius.small);

    return BlocBuilder<PlanningBloc, PlanningState>(
      builder: (context, state) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.colors.uniqueComponents.excursionTimetableBackground,
          borderRadius: borderRadius,
          border: Border.all(
            color: theme.colors.uniqueComponents.excursionTimetableBorder,
            width: theme.dimensions.size.line.small,
          )
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: ListView.separated(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: TimetableConfig.availableHoursPerDay,
            itemBuilder: (context, index) => TimetableItem(
              time: DateTime.now().copyWith(
                hour: index + TimetableConfig.firstHour,
                minute: 0,
              ),
              onEvent: onEvent,
            ),
            separatorBuilder: (context, _) => Container(
              width: double.infinity,
              height: theme.dimensions.size.line.small,
              color: theme.colors.uniqueComponents.excursionTimetableBackground,
            ),
          ),
        ),
      ),
    );
  }
}
