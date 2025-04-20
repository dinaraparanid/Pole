import 'package:dartx/dartx.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/widget/category_item.dart';

final class CategoryLine extends StatelessWidget {
  final IList<PlaceCategory> availableCategories;
  final ISet<PlaceCategoryId> selectedCategories;
  final void Function(PlaceCategoryId) onItemClick;

  const CategoryLine({
    super.key,
    required this.availableCategories,
    required this.selectedCategories,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final separatorPadding = theme.dimensions.padding.medium;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: separatorPadding,
        children: [
          SizedBox(),

          ...availableCategories.mapIndexed((index, category) {
            final category = availableCategories[index];
            final isSelected = selectedCategories.contains(category.id);

            return CategoryItem(
              key: ValueKey(category.id.value),
              category: category,
              isSelected: isSelected,
              onClick: () => onItemClick(category.id),
            );
          }),

          SizedBox(),
        ],
      ),
    );
  }
}