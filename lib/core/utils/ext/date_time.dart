extension DateTimeExt on DateTime {
  String toAppDateFormat() => '${day.zeroed}.${month.zeroed}.$year';
  String toAppTimeFormat() => '${hour.zeroed}:${minute.zeroed}';

  DateTime toBeginningOfDay() =>
    copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
}

extension _DateFormat on int {
  String get zeroed => this < 10 ? '0$this' : '$this';
}
