import 'package:dartx/dartx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pole/core/presentation/excursion/excursion_place_controller.dart';
import 'package:pole/core/presentation/foundation/app_network_image.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/core/utils/ext/date_time.dart';
import 'package:pole/core/utils/ext/duration.dart';
import 'package:pole/core/domain/excursion/entity/visitation.dart';
import 'package:pole/l10n/app_localizations.dart';

const _maxLinesTitle = 2;
const _maxLinesCategory = 1;
const _maxLinesInfo = 2;

final class VisitationNode extends StatefulWidget {
  final Visitation visitation;
  final ExcursionPlaceController? controller;
  final void Function(ExcursionPlaceController) onControllerAttached;

  const VisitationNode({
    super.key,
    required this.visitation,
    this.controller,
    required this.onControllerAttached,
  });

  @override
  State<StatefulWidget> createState() => _VisitationNodeState();
}

final class _VisitationNodeState extends State<VisitationNode> {

  late final controller = widget.controller ?? ExcursionPlaceController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) =>
      widget.onControllerAttached(controller),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return Container(
      key: controller.key,
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
        widget.visitation.place.name,
        maxLines: _maxLinesTitle,
        overflow: TextOverflow.ellipsis,
        style: theme.typography.body.copyWith(
          color: theme.colors.text.primary,
        ),
      ),

      Text(
        widget.visitation.place.category.name,
        maxLines: _maxLinesCategory,
        overflow: TextOverflow.ellipsis,
        style: theme.typography.body.copyWith(
          color: theme.colors.text.secondary,
        ),
      ),
    ],
  );

  Widget StartTime({required AppTheme theme}) => Text(
    widget.visitation.startTime.toAppTimeFormat(),
    style: theme.typography.body.copyWith(
      color: theme.colors.text.primary,
    ),
  );

  Widget PlaceCover({required AppTheme theme}) => ClipRRect(
    borderRadius: BorderRadius.circular(theme.dimensions.radius.extraSmall),
    child: AppNetworkImage(
      url: widget.visitation.place.images.firstOrNull.orEmpty(),
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

          Expanded(
            child: Text(
              widget.visitation.place.address,
              maxLines: _maxLinesInfo,
              overflow: TextOverflow.ellipsis,
              style: theme.typography.caption.copyWith(
                color: theme.colors.text.secondary,
              ),
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

          Expanded(
            child: Text(
              widget.visitation.duration.toAppHoursFormat(strings: strings),
              maxLines: _maxLinesInfo,
              overflow: TextOverflow.ellipsis,
              style: theme.typography.caption.copyWith(
                color: theme.colors.text.secondary,
              ),
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
