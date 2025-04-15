import 'package:dartx/dartx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/core/utils/ext/date_time.dart';
import 'package:pole/core/utils/ext/duration.dart';
import 'package:pole/feature/excursions/child/planning/domain/visitation.dart';
import 'package:pole/l10n/app_localizations.dart';

const _maxLinesTitle = 2;
const _maxLinesCategory = 1;

final class VisitationNode extends StatelessWidget {
  final Visitation visitation;
  const VisitationNode({super.key, required this.visitation});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return Container(
      decoration: BoxDecoration(
        color: theme.colors.background.secondary,
        borderRadius: BorderRadius.circular(theme.dimensions.radius.small),
      ),
      padding: EdgeInsets.all(theme.dimensions.padding.extraMedium),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: TitleWithCategory(theme: theme)),
              SizedBox(width: theme.dimensions.padding.medium),
              StartTime(theme: theme),
            ],
          ),

          SizedBox(height: theme.dimensions.padding.medium),

          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlaceCover(theme: theme),
              SizedBox(width: theme.dimensions.padding.medium),
              Expanded(child: AddressWithTime(theme: theme, strings: strings)),
            ],
          ),
        ],
      ),
    );
  }

  Widget TitleWithCategory({required AppTheme theme}) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        visitation.place.name,
        maxLines: _maxLinesTitle,
        overflow: TextOverflow.ellipsis,
        style: theme.typography.body.copyWith(
          color: theme.colors.text.primary,
        ),
      ),

      Text(
        visitation.place.category.name,
        maxLines: _maxLinesCategory,
        overflow: TextOverflow.ellipsis,
        style: theme.typography.body.copyWith(
          color: theme.colors.text.secondary,
        ),
      ),
    ],
  );

  Widget StartTime({required AppTheme theme}) => Text(
    visitation.startTime.toAppTimeFormat(),
    style: theme.typography.body.copyWith(
      color: theme.colors.text.primary,
    ),
  );

  Widget PlaceCover({required AppTheme theme}) => ClipRRect(
    borderRadius: BorderRadius.circular(theme.dimensions.radius.extraSmall),
    child: Image.network(
      visitation.place.images.firstOrNull.orEmpty(),
      width: theme.dimensions.size.big,
      height: theme.dimensions.size.extraMedium,
      fit: BoxFit.cover,
    ),
  );

  Widget AddressWithTime({
    required AppTheme theme,
    required AppLocalizations strings,
  }) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PrefixIcon(theme: theme, filename: 'ic_map_pin'),

          SizedBox(width: theme.dimensions.padding.small),

          Text(
            visitation.place.address,
            style: theme.typography.caption.copyWith(
              color: theme.colors.text.secondary,
            ),
          ),
        ],
      ),

      SizedBox(height: theme.dimensions.padding.medium),

      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PrefixIcon(theme: theme, filename: 'ic_timer'),

          SizedBox(width: theme.dimensions.padding.small),

          Text(
            visitation.duration.toAppHoursFormat(strings: strings),
            style: theme.typography.caption.copyWith(
              color: theme.colors.text.secondary,
            ),
          ),
        ],
      ),
    ],
  );

  Widget PrefixIcon({
    required AppTheme theme,
    required String filename,
  }) => SvgPicture.asset(
    AppImages.loadSvg(filename).value,
    width: theme.dimensions.size.extraSmall,
    height: theme.dimensions.size.extraSmall,
    colorFilter: ColorFilter.mode(
      theme.colors.text.secondary,
      BlendMode.srcIn,
    ),
  );
}
