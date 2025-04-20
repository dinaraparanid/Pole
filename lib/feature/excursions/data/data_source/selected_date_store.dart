import 'package:dartx/dartx.dart';
import 'package:pole/core/domain/base_store.dart';
import 'package:rxdart/rxdart.dart';
import 'package:pole/core/utils/ext/general.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

final class SelectedDateStore with BaseStore {
  static const _keySelectedDate = 'selected_date';

  Future<DateTime?> get selectedDate async {
    final prefs = RxSharedPreferences.getInstance();
    final millis = await prefs.getInt(_keySelectedDate);

    return millis
      ?.let((m) => DateTime.fromMillisecondsSinceEpoch(m))
      .takeIf(_isDateValid);
  }

  Stream<DateTime> get selectedDateStream => RxSharedPreferences
    .getInstance()
    .getIntStream(_keySelectedDate)
    .whereNotNull()
    .map((millis) => DateTime
      .fromMillisecondsSinceEpoch(millis)
      .takeIf(_isDateValid),
    )
    .whereNotNull()
    .distinct();

  Future<void> storeSelectedDate(DateTime date) => RxSharedPreferences
    .getInstance()
    .setInt(_keySelectedDate, date.millisecondsSinceEpoch);

  bool _isDateValid(DateTime date) =>
    date.date >= DateTime.now().date;

  @override
  Future<void> clear() => RxSharedPreferences
    .getInstance()
    .remove(_keySelectedDate);
}
