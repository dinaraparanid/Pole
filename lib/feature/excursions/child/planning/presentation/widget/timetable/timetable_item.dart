import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/core/utils/ext/date_time.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/planning/presentation/widget/timetable/timetable_config.dart';

final class TimetableItem extends StatelessWidget {
  final DateTime time;
  final VisitPlace? place;
  final void Function(PlanningEvent) onEvent;

  const TimetableItem({
    super.key,
    required this.time,
    this.place,
    required this.onEvent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return Container(
      color: theme.colors.uniqueComponents.excursionTimetableItemBackground,
      height: TimetableConfig.itemHeight,
      child: Row(
        children: [
          SizedBox(width: theme.dimensions.padding.small),

          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              time.toAppTimeFormat(),
              style: theme.typography.caption.copyWith(
                color: theme.colors.text.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          Expanded(child: SizedBox()),

          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () => switch (place) {
                null => onEvent(ShowPlaceSelector(startTime: time)),
                _ => onEvent(RemovePlace()),
              },
              child: SvgPicture.asset(
                AppImages.loadSvg('ic_plus').value,
                width: theme.dimensions.size.small,
                height: theme.dimensions.size.small,
              ),
            ),
          ),

          SizedBox(width: theme.dimensions.padding.extraMedium),
        ],
      ),
    );
  }
}
