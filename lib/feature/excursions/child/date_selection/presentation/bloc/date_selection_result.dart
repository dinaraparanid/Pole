import 'package:pole/core/domain/city/entity/city.dart';

final class DateSelectionResult {
  final City selectedCity;
  final DateTime selectedDate;

  DateSelectionResult({
    required this.selectedCity,
    required this.selectedDate,
  });
}
