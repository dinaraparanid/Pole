sealed class DateSelectionEvent {}

final class SelectDate extends DateSelectionEvent {
  final DateTime date;
  SelectDate({required this.date});
}

final class ContinueClick extends DateSelectionEvent {}
