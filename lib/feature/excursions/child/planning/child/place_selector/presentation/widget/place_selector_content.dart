import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/cupertino.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/widget/category_line.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/widget/places_paging_list.dart';

final class PlaceSelectorContent extends StatelessWidget {
  final IList<PlaceCategory> availableCategories;
  final ISet<PlaceCategoryId> selectedCategories;
  final void Function(PlaceSelectorEvent) onEvent;

  const PlaceSelectorContent({
    super.key,
    required this.availableCategories,
    required this.selectedCategories,
    required this.onEvent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return Column(
      children: [
        SizedBox(height: theme.dimensions.padding.medium),

        CategoryLine(
          availableCategories: availableCategories,
          selectedCategories: selectedCategories,
          onItemClick: (id) => onEvent(SelectCategory(id: id)),
        ),

        SizedBox(height: theme.dimensions.padding.medium),

        Expanded(child: PlacesPagingList(onEvent: onEvent)),
      ],
    );
  }
}
