import 'package:pole/core/domain/account/data_source/account_store.dart';
import 'package:pole/core/domain/auth/data_source/auth_store.dart';
import 'package:pole/feature/excursions/data/data_source/excursion_name_store.dart';
import 'package:pole/feature/excursions/data/data_source/selected_city_store.dart';
import 'package:pole/feature/excursions/data/data_source/selected_date_store.dart';
import 'package:pole/feature/excursions/data/data_source/selected_places_store.dart';

final class StoreCleaner {
  final AccountStore _accountStore;
  final AuthStore _authStore;
  final SelectedCityStore _selectedCityStore;
  final SelectedDateStore _selectedDateStore;
  final ExcursionNameStore _excursionNameStore;
  final SelectedPlacesStore _selectedPlacesStore;

  StoreCleaner({
    required AccountStore accountStore,
    required AuthStore authStore,
    required SelectedCityStore selectedCityStore,
    required SelectedDateStore selectedDateStore,
    required ExcursionNameStore excursionNameStore,
    required SelectedPlacesStore selectedPlacesStore,
  }) : _accountStore = accountStore,
    _authStore = authStore,
    _selectedCityStore = selectedCityStore,
    _selectedDateStore = selectedDateStore,
    _excursionNameStore = excursionNameStore,
    _selectedPlacesStore = selectedPlacesStore;

  Future<void> call() async {
    await _accountStore.clear();
    await _authStore.clear();
    await _selectedCityStore.clear();
    await _selectedDateStore.clear();
    await _excursionNameStore.clear();
    await _selectedPlacesStore.clear();
  }
}
