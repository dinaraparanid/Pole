import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';

final class SelectCategoryUseCase {
  void call({
    required PlaceCategoryId categoryId,
    required ISet<PlaceCategoryId> currentSelected,
    required void Function(ISet<PlaceCategoryId>) updateSelection,
  }) => switch (currentSelected.contains(categoryId)) {
    true => updateSelection(currentSelected.remove(categoryId)),
    false => updateSelection(currentSelected.add(categoryId)),
  };
}
