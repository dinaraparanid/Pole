import 'package:pole/feature/excursions/presentation/bloc/excursions_step.dart';

sealed class ExcursionsEvent {}

final class UpdateStep extends ExcursionsEvent {
  final ExcursionsStep step;
  UpdateStep({required this.step});
}
