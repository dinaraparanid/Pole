import 'package:pole/feature/excursions/data/data_source/current_excursion_step_store.dart';
import 'package:pole/feature/excursions/data/data_source/excursion_name_store.dart';
import 'package:pole/feature/excursions/data/data_source/selected_city_store.dart';
import 'package:pole/feature/excursions/data/data_source/selected_date_store.dart';
import 'package:pole/feature/excursions/data/data_source/selected_places_store.dart';

final class ExcursionStoreCleaner {
  final CurrentExcursionStepStore _currentExcursionStepStore;
  final ExcursionNameStore _excursionNameStore;
  final SelectedCityStore _selectedCityStore;
  final SelectedDateStore _selectedDateStore;
  final SelectedPlacesStore _selectedPlacesStore;

  ExcursionStoreCleaner({
    required CurrentExcursionStepStore currentExcursionStepStore,
    required ExcursionNameStore excursionNameStore,
    required SelectedCityStore selectedCityStore,
    required SelectedDateStore selectedDateStore,
    required SelectedPlacesStore selectedPlacesStore,
  }) : _currentExcursionStepStore = currentExcursionStepStore,
    _excursionNameStore = excursionNameStore,
    _selectedCityStore = selectedCityStore,
    _selectedDateStore = selectedDateStore,
    _selectedPlacesStore = selectedPlacesStore;

  Future<void> call() async {
    await _currentExcursionStepStore.clear();
    await _excursionNameStore.clear();
    await _selectedCityStore.clear();
    await _selectedDateStore.clear();
    await _selectedPlacesStore.clear();
  }
}
