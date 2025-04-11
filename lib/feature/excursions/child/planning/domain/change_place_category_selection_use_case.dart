import 'package:pole/core/domain/visit_place/entity/mod.dart';

final class SelectCategoryUseCase {
  void execute({
    required PlaceCategoryId categoryId,
    required Set<PlaceCategoryId> currentSelected,
    required void Function(Set<PlaceCategoryId>) updateSelection,
  }) => switch (currentSelected.contains(categoryId)) {
    true => updateSelection(currentSelected..remove(categoryId)),
    false => updateSelection(currentSelected..add(categoryId)),
  };
}
