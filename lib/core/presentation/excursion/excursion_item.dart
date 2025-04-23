import 'package:dartx/dartx.dart';
import 'package:flutter/cupertino.dart';
import 'package:pole/core/domain/excursion/entity/excursion.dart';
import 'package:pole/core/presentation/foundation/app_network_image.dart';
import 'package:pole/core/presentation/foundation/app_clickable.dart';
import 'package:pole/core/presentation/theme/mod.dart';

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

    return Container(
      decoration: BoxDecoration(
        color: theme.colors.background.secondary,
        borderRadius: BorderRadius.circular(
          theme.dimensions.radius.small,
        ),
      ),
      child: AppClickable(
        onClick: onClick,
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
                url: excursion.images.firstOrNull.orEmpty(),
                width: theme.dimensions.size.large,
                height: theme.dimensions.size.extraBig,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}