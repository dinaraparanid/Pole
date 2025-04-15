import 'package:pole/l10n/app_localizations.dart';

extension DurationExt on Duration {
  String toAppHoursFormat({required AppLocalizations strings}) =>
    "~${strings.hours(inHours)}";
}
