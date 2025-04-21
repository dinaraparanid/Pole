import 'dart:async';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/core/domain/excursion/entity/excursion_name.dart';
import 'package:pole/feature/excursions/child/planning/domain/visitation.dart';
import 'package:pole/feature/excursions/data/data_source/excursion_name_store.dart';
import 'package:pole/feature/excursions/data/data_source/selected_city_store.dart';
import 'package:pole/feature/excursions/data/data_source/selected_date_store.dart';
import 'package:pole/feature/excursions/data/data_source/selected_places_store.dart';
import 'package:rxdart/rxdart.dart';

final class ExcursionConfigRepository {
  final SelectedCityStore _cityStore;
  final SelectedDateStore _dateStore;
  final ExcursionNameStore _excursionNameStore;
  final SelectedPlacesStore _selectedPlacesStore;

  ExcursionConfigRepository({
    required SelectedCityStore cityStore,
    required SelectedDateStore dateStore,
    required ExcursionNameStore excursionNameStore,
    required SelectedPlacesStore selectedPlacesStore,
  }) : _cityStore = cityStore,
    _dateStore = dateStore,
    _excursionNameStore = excursionNameStore,
    _selectedPlacesStore = selectedPlacesStore;

  Stream<(City?, DateTime?, ExcursionName, IList<Visitation>)> configChanges() =>
    CombineLatestStream.combine4(
      _cityStore.selectedCityStream,
      _dateStore.selectedDateStream,
      _excursionNameStore.excursionNameStream,
      _selectedPlacesStore.selectedPlacesStream,
      (city, date, name, places) => (city, date, name, places),
    );

  Future<void> selectCity(City city) =>
    _cityStore.storeSelectedCity(city);

  Future<void> selectDate(DateTime date) =>
    _dateStore.storeSelectedDate(date);

  Future<void> setExcursionName(ExcursionName name) =>
    _excursionNameStore.storeExcursionName(name);

  Future<void> storeSelectedPlaces(IList<Visitation> places) =>
    _selectedPlacesStore.storeSelectedPlaces(places);
}
