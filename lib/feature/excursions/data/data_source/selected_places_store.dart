import 'dart:convert';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pole/core/domain/base_store.dart';
import 'package:pole/feature/excursions/child/planning/domain/visitation.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

final class SelectedPlacesStore with BaseStore {
  static const _keySelectedPlaces = 'selected_places';

  Future<IList<Visitation>> get selectedPlaces async {
    final prefs = RxSharedPreferences.getInstance();
    final jsons = await prefs.getStringList(_keySelectedPlaces);

    return jsons
      ?.map((s) => Visitation.fromJson(jsonDecode(s)))
      .toIList()
      ?? const IList.empty();
  }

  Stream<IList<Visitation>> get selectedPlacesStream => RxSharedPreferences
    .getInstance()
    .getStringListStream(_keySelectedPlaces)
    .map((j) => j ?? [])
    .map((jsons) => jsons
      .map((s) => Visitation.fromJson(jsonDecode(s)))
      .toIList()
    )
    .distinct();

  Future<void> storeSelectedPlaces(IList<Visitation> places) => RxSharedPreferences
    .getInstance()
    .setStringList(
      _keySelectedPlaces,
      places.map((v) => jsonEncode(v.toJson())).toList(),
    );

  @override
  Future<void> clear() => RxSharedPreferences
    .getInstance()
    .remove(_keySelectedPlaces);
}
