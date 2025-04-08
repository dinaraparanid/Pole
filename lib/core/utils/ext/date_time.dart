extension DateTimeExt on DateTime {
  String toAppDateFormat() => '${day.zeroed}.${month.zeroed}.$year';
  String toAppTimeFormat() => '${hour.zeroed}.${minute.zeroed}';
}

extension _DateFormat on int {
  String get zeroed => this < 10 ? '0$this' : '$this';
}
