import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  const TimetableItem({
    super.key,
    required this.startTime,
    this.visitation,
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

          SizedBox(width: theme.dimensions.padding.extraSmall),

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

          SizedBox(width: theme.dimensions.padding.extraSmall),

          Align(
            alignment: Alignment.center,
            child: SuffixIcon(context: context),
          ),

          SizedBox(width: theme.dimensions.padding.extraMedium),
        ],
      ),
    );
  }

  Widget? SuffixIcon({required BuildContext context}) {
    if (visitation != null && visitation?.startTime != startTime) {
      return null;
    }

    final theme = context.appTheme;

    return AppClickable(
      border: CircleBorder(),
      rippleColor: theme.colors.text.disabled,
      onClick: switch (visitation) {
        null => () => BlocProvider
          .of<PlanningBloc>(context)
          .add(ShowPlaceSelector(startTime: startTime)),

        final v => () => BlocProvider
          .of<PlanningBloc>(context)
          .add(RemovePlace(visitation: v)),
      },
      child: SvgPicture.asset(
        AppImages.loadSvg(visitation == null ? 'ic_plus' : 'ic_bin').value,
        width: theme.dimensions.size.small,
        height: theme.dimensions.size.small,
      ),
    );
  }
}
