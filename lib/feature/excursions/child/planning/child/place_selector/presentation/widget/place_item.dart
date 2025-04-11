import 'package:dartx/dartx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/presentation/foundation/app_clickable.dart';
import 'package:pole/core/presentation/theme/mod.dart';

final class PlaceItem extends StatelessWidget {
  final VisitPlace place;
  final void Function() onClick;

  const PlaceItem({
    super.key,
    required this.place,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final borderRadius = BorderRadius.circular(theme.dimensions.radius.small);

    return Container(
      decoration: BoxDecoration(
        color: theme.colors.containerBackground,
        borderRadius: borderRadius,
      ),
      child: AppClickable(
        onClick: onClick,
        border: RoundedRectangleBorder(borderRadius: borderRadius),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                theme.dimensions.radius.extraSmall,
              ),
              child: Image.network(
                place.images.firstOrNull.orEmpty(),
                width: theme.dimensions.size.big,
                height: theme.dimensions.size.extraMedium,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: theme.dimensions.padding.medium),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: theme.typography.body.copyWith(
                      color: theme.colors.text.primary,
                    ),
                  ),

                  SizedBox(height: theme.dimensions.padding.small),

                  Text(
                    place.category.name,
                    style: theme.typography.regular.copyWith(
                      color: theme.colors.text.secondary,
                    ),
                  ),
                ],
              ),
            ),

            SvgPicture.asset(
              AppImages.loadSvg('ic_plus').value,
              width: theme.dimensions.size.small,
              height: theme.dimensions.size.small,
            ),
          ],
        ),
      ),
    );
  }
}
