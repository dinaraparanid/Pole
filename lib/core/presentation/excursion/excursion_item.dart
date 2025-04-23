import 'package:dartx/dartx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pole/core/domain/excursion/entity/excursion.dart';
import 'package:pole/core/presentation/foundation/app_network_image.dart';
import 'package:pole/core/presentation/foundation/app_clickable.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/core/utils/ext/date_time.dart';

final class ExcursionItem extends StatelessWidget {
  final Excursion excursion;
  final void Function() onClick;

  const ExcursionItem({
    super.key,
    required this.excursion,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    final borderRadius = BorderRadius.circular(
      theme.dimensions.radius.small,
    );

    return Container(
      decoration: BoxDecoration(
        color: theme.colors.background.secondary,
        borderRadius: borderRadius,
      ),
      child: AppClickable(
        onClick: onClick,
        rippleColor: theme.colors.text.disabled,
        border: RoundedRectangleBorder(borderRadius: borderRadius),
        child: Padding(
          padding: EdgeInsets.only(
            top: theme.dimensions.padding.medium,
            left: theme.dimensions.padding.medium,
            right: theme.dimensions.padding.medium,
            bottom: theme.dimensions.padding.small,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppNetworkImage(
                url: excursion.info.images.firstOrNull.orEmpty(),
                width: theme.dimensions.size.large,
                height: theme.dimensions.size.extraBig,
                fit: BoxFit.cover,
              ),

              SizedBox(height: theme.dimensions.padding.small),

              Text(
                excursion.info.name.value,
                style: theme.typography.caption.copyWith(
                  color: theme.colors.text.primary,
                ),
              ),

              SizedBox(height: theme.dimensions.padding.small),

              DateWithTime(context: context),
            ],
          ),
        ),
      ),
    );
  }

  Widget DateWithTime({required BuildContext context}) {
    final theme = context.appTheme;
    final color = theme.colors.text.secondary;
    final firstPlace = excursion.info.visitations.first;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppImages.loadSvg('ic_calendar').value,
          width: theme.dimensions.size.extraSmall,
          height: theme.dimensions.size.extraSmall,
        ),

        SizedBox(width: theme.dimensions.padding.extraSmall),

        Text(
          firstPlace.startTime.toAppDateFormat(),
          style: theme.typography.captionSm.copyWith(color: color),
        ),

        SizedBox(width: theme.dimensions.padding.extraSmall),

        SvgPicture.asset(
          AppImages.loadSvg('ic_clock').value,
          width: theme.dimensions.size.extraSmall,
          height: theme.dimensions.size.extraSmall,
        ),

        SizedBox(width: theme.dimensions.padding.extraSmall),

        Text(
          firstPlace.startTime.toAppTimeFormat(),
          style: theme.typography.captionSm.copyWith(color: color),
        ),
      ],
    );
  }
}
