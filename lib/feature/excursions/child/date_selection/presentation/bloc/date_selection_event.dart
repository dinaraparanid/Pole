import 'package:pole/core/domain/city/entity/city.dart';

sealed class DateSelectionEvent {}

final class UpdateState extends DateSelectionEvent {
  final City city;
  final DateTime date;
  UpdateState({required this.city, required this.date});
}

final class SelectDate extends DateSelectionEvent {
  final DateTime date;
  SelectDate({required this.date});
}

final class ContinueClick extends DateSelectionEvent {}
