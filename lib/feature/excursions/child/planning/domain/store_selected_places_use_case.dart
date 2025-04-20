import 'package:dartx/dartx.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/planning_state.dart';
import 'package:pole/feature/excursions/data/repository/excursion_config_repository.dart';

final class StoreSelectedPlacesUseCase {
  final ExcursionConfigRepository _repository;

  StoreSelectedPlacesUseCase({
    required ExcursionConfigRepository repository
  }) : _repository = repository;

  Future<void> call({required PlanningState state}) =>
    _repository.storeSelectedPlaces(
      state.produceTimetable().whereNotNull().toIList()
    );
}
