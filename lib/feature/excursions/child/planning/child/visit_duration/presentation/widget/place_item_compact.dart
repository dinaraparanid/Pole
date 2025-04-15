import 'package:dartx/dartx.dart';
import 'package:flutter/widgets.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/presentation/theme/mod.dart';

final class PlaceItemCompact extends StatelessWidget {
  final VisitPlace place;

  const PlaceItemCompact({
    super.key,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final borderRadius = BorderRadius.circular(theme.dimensions.radius.small);

    return Container(
      decoration: BoxDecoration(
        color: theme.colors.background.secondary,
        borderRadius: borderRadius,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: theme.dimensions.padding.small,
          horizontal: theme.dimensions.padding.small,
        ),
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

                  Text(
                    place.category.name,
                    style: theme.typography.regular.copyWith(
                      color: theme.colors.text.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
