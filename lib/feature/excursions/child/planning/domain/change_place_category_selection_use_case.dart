import 'package:dartx/dartx.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';

final class ChangePlaceCategorySelectionUseCase {
  void execute({
    required PlaceCategory category,
    required List<PlaceCategory> currentSelected,
    required void Function(List<PlaceCategory>) updateSelection,
  }) {
    final wasCategorySelected = currentSelected.firstOrNullWhere((cat) =>
      cat.id == category.id
    ) != null;

    switch (wasCategorySelected) {
      case true:
        updateSelection(
          currentSelected
            .where((cat) => cat.id != category.id)
            .toList(growable: false)
        );

      case false:
        updateSelection(currentSelected..add(category));
    }
  }
}
