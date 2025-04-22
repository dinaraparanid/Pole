import 'package:pole/core/domain/account/data_source/account_store.dart';
import 'package:pole/core/domain/auth/data_source/auth_store.dart';
import 'package:pole/feature/excursions/data/data_source/current_excursion_step_store.dart';
import 'package:pole/feature/excursions/data/data_source/excursion_name_store.dart';
import 'package:pole/feature/excursions/data/data_source/selected_city_store.dart';
import 'package:pole/feature/excursions/data/data_source/selected_date_store.dart';
import 'package:pole/feature/excursions/data/data_source/selected_places_store.dart';
import 'package:pole/feature/excursions/data/excursion_store_cleaner.dart';

final class StoreCleaner {
  final AccountStore _accountStore;
  final AuthStore _authStore;
  final ExcursionStoreCleaner _excursionStoreCleaner;

  StoreCleaner({
    required AccountStore accountStore,
    required AuthStore authStore,
    required ExcursionStoreCleaner excursionStoreCleaner,
  }) : _accountStore = accountStore,
    _authStore = authStore,
    _excursionStoreCleaner = excursionStoreCleaner;

  Future<void> call() async {
    await _accountStore.clear();
    await _authStore.clear();
    await _excursionStoreCleaner();
  }
}
