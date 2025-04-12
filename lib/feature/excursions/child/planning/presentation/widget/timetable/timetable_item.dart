import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pole/core/presentation/foundation/app_clickable.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/core/utils/ext/date_time.dart';
import 'package:pole/core/utils/ext/general.dart';
import 'package:pole/feature/excursions/child/planning/domain/visitation.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/planning/presentation/widget/timetable/timetable_config.dart';

const _animDuration = Duration(milliseconds: 300);

final class TimetableItem extends StatelessWidget {
  final DateTime startTime;
  final Visitation? visitation;
  final void Function(PlanningEvent) onEvent;

  const TimetableItem({
    super.key,
    required this.startTime,
    this.visitation,
    required this.onEvent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final endTime = startTime.add(Duration(hours: 1));

    return AnimatedContainer(
      duration: _animDuration,
      height: TimetableConfig.itemHeight,
      child: Row(
        children: [
          SizedBox(width: theme.dimensions.padding.small),

          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              endTime.toAppTimeFormat(),
              style: theme.typography.caption.copyWith(
                color: theme.colors.text.primary,
              ),
            ),
          ),

          Expanded(
            child: visitation
              ?.takeIf((v) => v.startTime == startTime)
              ?.let((v) => Text(
                v.place.name,
                style: theme.typography.caption.copyWith(
                  color: theme.colors.text.primary,
                ),
              ))
              ?? SizedBox(),
          ),

          Align(
            alignment: Alignment.center,
            child: SuffixIcon(theme: theme),
          ),

          SizedBox(width: theme.dimensions.padding.extraMedium),
        ],
      ),
    );
  }

  Widget? SuffixIcon({required AppTheme theme}) {
    if (visitation != null && visitation?.startTime != startTime) {
      return null;
    }

    return AppClickable(
      border: CircleBorder(),
      rippleColor: theme.colors.text.disabled,
      onClick: switch (visitation) {
        null => () => onEvent(ShowPlaceSelector(startTime: startTime)),
        final v => () => onEvent(RemovePlace(visitation: v)),
      },
      child: SvgPicture.asset(
        AppImages.loadSvg(visitation == null ? 'ic_plus' : 'ic_bin').value,
        width: theme.dimensions.size.small,
        height: theme.dimensions.size.small,
      ),
    );
  }
}
