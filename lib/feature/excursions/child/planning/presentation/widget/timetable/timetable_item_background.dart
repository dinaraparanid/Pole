import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/core/utils/ext/general.dart';
import 'package:pole/feature/excursions/child/planning/domain/visitation.dart';
import 'package:pole/feature/excursions/child/planning/presentation/widget/timetable/timetable_config.dart';

const _animDuration = Duration(milliseconds: 300);
const _imageOpacity = 0.75;

final class TimetableItemBackground extends StatelessWidget {
  final Visitation? visitation;
  final double separatorHeight;

  const TimetableItemBackground({
    super.key,
    this.visitation,
    required this.separatorHeight,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return AnimatedContainer(
      duration: _animDuration,
      height: switch (visitation) {
        null => TimetableConfig.itemHeight,
        final v => TimetableConfig.itemHeight * v.duration.inHours +
          separatorHeight * (v.duration.inHours - 1),
      },
      decoration: BoxDecoration(
        color: theme.colors.uniqueComponents.excursionTimetableItemBackground,
        image: visitation?.place.images.firstOrNull?.let((img) =>
          DecorationImage(
            image: NetworkImage(img),
            opacity: _imageOpacity,
            fit: BoxFit.cover,
            onError: (_, _) => SizedBox(),
          ),
        ),
      ),
    );
  }
}
