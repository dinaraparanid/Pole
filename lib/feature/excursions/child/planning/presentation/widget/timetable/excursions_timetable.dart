import 'package:dartx/dartx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/planning/presentation/widget/timetable/timetable_config.dart';
import 'package:pole/feature/excursions/child/planning/presentation/widget/timetable/timetable_item.dart';
import 'package:pole/feature/excursions/child/planning/presentation/widget/timetable/timetable_item_background.dart';

final class ExcursionsTimetable extends StatelessWidget {
  const ExcursionsTimetable({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final borderRadius = BorderRadius.circular(theme.dimensions.radius.small);

    return BlocBuilder<PlanningBloc, PlanningState>(
      builder: (context, state) {
        final timetable = state.produceTimetable();
        final separatorHeight = theme.dimensions.size.line.small;

        final separatorColored = Container(
          width: double.infinity,
          height: separatorHeight,
          color: theme.colors.uniqueComponents.excursionTimetableBackground,
        );

        final separatorTransparent = SizedBox(
          width: double.infinity,
          height: separatorHeight,
        );

        return Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxHeight: TimetableConfig.itemHeight * TimetableConfig.availableHoursPerDay +
              separatorHeight * (TimetableConfig.availableHoursPerDay + 1),
          ),
          decoration: BoxDecoration(
            color: theme.colors.uniqueComponents.excursionTimetableBackground,
            borderRadius: borderRadius,
            border: Border.all(
              color: theme.colors.uniqueComponents.excursionTimetableBorder,
              width: theme.dimensions.size.line.small,
            ),
          ),
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Stack(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: timetable.length,
                  itemBuilder: (context, index) =>
                    TimetableItemBackground(
                      visitation: timetable[index],
                      separatorHeight: separatorHeight,
                    ),
                  separatorBuilder: (_, _) => separatorTransparent,
                ),

                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: TimetableConfig.availableHoursPerDay,
                  itemBuilder: (context, index) {
                    final startTime = state.date.copyWith(
                      hour: index + TimetableConfig.firstHour,
                      minute: 0,
                    );

                    return TimetableItem(
                      key: ValueKey(startTime),
                      startTime: startTime,
                      visitation: state.visitationAt(time: startTime),
                    );
                  },
                  separatorBuilder: (context, _) => separatorColored,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
