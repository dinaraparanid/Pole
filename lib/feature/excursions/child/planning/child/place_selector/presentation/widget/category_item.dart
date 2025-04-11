import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/presentation/foundation/app_clickable.dart';
import 'package:pole/core/presentation/theme/mod.dart';

final class CategoryItem extends StatelessWidget {
  final PlaceCategory category;
  final bool isSelected;
  final void Function() onClick;

  const CategoryItem({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final borderRadius = BorderRadius.circular(theme.dimensions.radius.small);

    return Wrap(children: [
      Container(
        decoration: BoxDecoration(
          color: isSelected
          ? theme.colors.uniqueComponents.activeFilter
          : theme.colors.uniqueComponents.inactiveFilter,
          borderRadius: borderRadius,
        ),
        child: AppClickable(
          onClick: onClick,
          border: RoundedRectangleBorder(borderRadius: borderRadius),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: theme.dimensions.padding.medium,
              horizontal: theme.dimensions.padding.medium,
            ),
            child: Text(
              category.name,
              style: theme.typography.captionSm.copyWith(
                color: theme.colors.text.primary,
              ),
            ),
          ),
        ),
      )
    ]);
  }
}