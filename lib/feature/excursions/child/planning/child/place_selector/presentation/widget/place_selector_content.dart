import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/widget/category_line.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/widget/places_paging_list.dart';

final class PlaceSelectorContent extends StatelessWidget {
  final IList<PlaceCategory> availableCategories;
  final ISet<PlaceCategoryId> selectedCategories;

  const PlaceSelectorContent({
    super.key,
    required this.availableCategories,
    required this.selectedCategories,
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
          onItemClick: (id) => BlocProvider
            .of<PlaceSelectorBloc>(context)
            .add(SelectCategory(id: id)),
        ),

        SizedBox(height: theme.dimensions.padding.medium),

        Expanded(child: PlacesPagingList()),
      ],
    );
  }
}
