extension DateTimeExt on DateTime {
  String toAppDateFormat() => '${day.dateFormat}.${month.dateFormat}.$year';
}

extension _DateFormat on int {
  String get dateFormat => this < 10 ? '0$this' : '$this';
}
