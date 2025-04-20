import 'dart:convert';
import 'package:pole/core/domain/base_store.dart';
import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/core/utils/ext/general.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

final class SelectedCityStore with BaseStore {
  static const _keySelectedCity = 'selected_city';

  Future<City?> get selectedCity async {
    final prefs = RxSharedPreferences.getInstance();
    final json = await prefs.getString(_keySelectedCity);
    return json?.let((s) => City.fromJson(jsonDecode(s)));
  }

  Stream<City?> get selectedCityStream => RxSharedPreferences
    .getInstance()
    .getStringStream(_keySelectedCity)
    .map((json) => json?.let((s) => City.fromJson(jsonDecode(s))))
    .distinct();

  Future<void> storeSelectedCity(City city) => RxSharedPreferences
    .getInstance()
    .setString(_keySelectedCity, jsonEncode(city.toJson()));

  @override
  Future<void> clear() => RxSharedPreferences
    .getInstance()
    .remove(_keySelectedCity);
}
