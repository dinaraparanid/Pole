import 'package:dartx/dartx.dart';
import 'package:pole/core/domain/base_store.dart';
import 'package:pole/core/domain/excursion/excursion_name.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

final class ExcursionNameStore with BaseStore {
  static const _keyExcursionName = 'excursion_name';

  Future<ExcursionName> get excursionName async {
    final prefs = RxSharedPreferences.getInstance();
    final str = await prefs.getString(_keyExcursionName);
    return ExcursionName(value: str.orEmpty());
  }

  Stream<ExcursionName> get excursionNameStream => RxSharedPreferences
    .getInstance()
    .getStringStream(_keyExcursionName)
    .map((s) => ExcursionName(value: s.orEmpty()))
    .distinct();

  Future<void> storeExcursionName(ExcursionName name) => RxSharedPreferences
    .getInstance()
    .setString(_keyExcursionName, name.value);

  @override
  Future<void> clear() => RxSharedPreferences
    .getInstance()
    .remove(_keyExcursionName);
}
