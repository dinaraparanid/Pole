import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pole/core/domain/excursion/entity/excursion.dart';
import 'package:pole/core/domain/excursion/repository/excursion_repository.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';

final class LoadToursUseCase {
  final ExcursionRepository _repository;

  LoadToursUseCase({required ExcursionRepository repository}) :
    _repository = repository;

  Future<void> call({
    required String searchQuery,
    required void Function(UiState<IList<Excursion>>) update,
  }) => _repository.loadFavouriteExcursions().then((res) => res.fold(
    (e) => update(UiState.error(e)),
    (list) => update(UiState.data(
      value: searchQuery.isEmpty ? list : list
        .filter((it) => it.info.name.value.contains(searchQuery))
        .toIList(),
    )),
  ));
}
