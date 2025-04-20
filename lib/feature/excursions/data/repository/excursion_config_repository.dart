import 'dart:async';
import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/feature/excursions/data/data_source/selected_city_store.dart';
import 'package:pole/feature/excursions/data/data_source/selected_date_store.dart';
import 'package:rxdart/rxdart.dart';

final class ExcursionConfigRepository {
  final SelectedCityStore _cityStore;
  final SelectedDateStore _dateStore;

  ExcursionConfigRepository({
    required SelectedCityStore cityStore,
    required SelectedDateStore dateStore,
  }) : _cityStore = cityStore, _dateStore = dateStore;

  Stream<(City, DateTime)> configChanges() =>
    CombineLatestStream.combine2(
      _cityStore.selectedCityStream,
      _dateStore.selectedDateStream,
      (city, date) => (city, date),
    );

  Future<void> selectCity(City city) => _cityStore.storeSelectedCity(city);
  Future<void> selectDate(DateTime date) => _dateStore.storeSelectedDate(date);
}
