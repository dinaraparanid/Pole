import 'package:pole/core/domain/account/data_source/account_store.dart';
import 'package:pole/core/domain/auth/data_source/auth_store.dart';
import 'package:pole/feature/excursions/data/data_source/selected_city_store.dart';
import 'package:pole/feature/excursions/data/data_source/selected_date_store.dart';

final class StoreCleaner {
  final AccountStore _accountStore;
  final AuthStore _authStore;
  final SelectedCityStore _selectedCityStore;
  final SelectedDateStore _selectedDateStore;

  StoreCleaner({
    required AccountStore accountStore,
    required AuthStore authStore,
    required SelectedCityStore selectedCityStore,
    required SelectedDateStore selectedDateStore,
  }) : _accountStore = accountStore,
    _authStore = authStore,
    _selectedCityStore = selectedCityStore,
    _selectedDateStore = selectedDateStore;

  Future<void> call() async {
    await _accountStore.clear();
    await _authStore.clear();
    await _selectedCityStore.clear();
    await _selectedDateStore.clear();
  }
}
