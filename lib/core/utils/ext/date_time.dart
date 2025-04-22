import 'package:intl/intl.dart';

final _formatAppDate = DateFormat('dd.MM.yyyy');
final _formatAppTime = DateFormat('HH:mm');
final _formatIso8601Time = DateFormat('HH:mm:ss');

extension DateTimeExt on DateTime {
  String toAppDateFormat() => _formatAppDate.format(this);
  String toAppTimeFormat() => _formatAppTime.format(this);

  String toIso8601TimeFormat() {
    final time = _formatIso8601Time.format(this);
    final sign = timeZoneOffset.isNegative ? '-' : '+';
    final hours = timeZoneOffset.inHours.abs().zeroed;
    final minutes = (timeZoneOffset.inMinutes.abs() % 60).zeroed;
    return '$time$sign$hours:$minutes';
  }
}

extension _DateFormat on int {
  String get zeroed => toString().padLeft(2, '0');
}
