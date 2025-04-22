import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/core/domain/city/repository/city_repository.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';

final class LoadCitiesUseCase {
  final CityRepository _repository;

  LoadCitiesUseCase({required CityRepository repository}) :
    _repository = repository;

  Future<void> call({required Function(UiState<IList<City>>) update}) {
    update(UiState.loading());

    return _repository.loadCities().then((res) => res.fold(
      (e) => update(UiState.error(e)),
      (list) => update(UiState.data(value: list)),
    ));
  }
}
