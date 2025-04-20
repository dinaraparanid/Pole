import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/domain/visit_place/repository/category_repository.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';

final class LoadCategoriesUseCase {
  final CategoryRepository _repository;

  LoadCategoriesUseCase({required CategoryRepository repository}) :
    _repository = repository;

  Future<void> call({required Function(UiState<IList<PlaceCategory>>) update}) {
    update(UiState.loading());

    return _repository.loadCategories().then((res) => res.fold(
      (e) => update(UiState.error(e)),
      (list) => update(UiState.data(value: list)),
    ));
  }
}
